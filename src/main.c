#include <zephyr/kernel.h>
#include <zephyr/drivers/i2c.h>
#include <stdint.h>
#include <math.h>

int main(void)
{
static const struct i2c_dt_spec mag = I2C_DT_SPEC_GET(DT_NODELABEL(mag)); // define device

//vars
// #define NUM_SAMPLES 25

uint8_t payload[2];
uint8_t vals[2];
int16_t x_raw;
int16_t y_raw;
int16_t z_raw;
uint8_t adr;
uint8_t status_reg;
uint8_t zyxda;
float x_uT;
float y_uT;
float z_uT;
float field_strength;
// float field_strength_array[NUM_SAMPLES] = {0};
// int index = 0;

//configure CFG_REG_A_M 
payload[0] = 0x60;
payload[1] = 0b01100000;

i2c_write_dt(&mag, payload, sizeof(payload));

payload[0] = 0x60;
payload[1] = 0x00;

i2c_write_dt(&mag, payload, sizeof(payload));

//configure CFG_REG_C_M
payload[0] = 0x62;
payload[1] = 0x01;

i2c_write_dt(&mag, payload, sizeof(payload));

k_msleep(100);



while(1) {

    //see whether the mag is ready to send data
    adr = 0x67;
    i2c_write_read_dt(&mag, &adr, 1, &status_reg, 1);
    zyxda = status_reg & 8;

    if(zyxda) {
        //get data out of the mag
        adr = 0x68;
        i2c_burst_read_dt(&mag, adr, vals, 2);
        x_raw = (int16_t)((vals[1] << 8) | vals[0]);

        adr = 0x6A;
        i2c_burst_read_dt(&mag, adr, vals, 2);
        y_raw = (int16_t)((vals[1] << 8) | vals[0]);
        
        adr = 0x6C;
        i2c_burst_read_dt(&mag, adr, vals, 2);
        z_raw = (int16_t)((vals[1] << 8) | vals[0]);

        //calculate values
        x_uT = x_raw * 0.15f;
        y_uT = y_raw * 0.15f;
        z_uT = z_raw * 0.15f;

        field_strength = sqrt(pow(x_uT, 2) + pow(y_uT, 2) + pow(z_uT, 2));

    // TODO:
    // 1. check if the index is equal to the width of the sampling window
    // 2. if it isnt increment the index and record data into the array
    // 3. if it is equal then perform lpf+derivative on array
    // 4. Event detection (TBD): state machine, if it is above/below by some percentage and it goes high low high etc then detect that as cap coming on or off

    // Incrementation:
    // 1. fixed window w lpf+derivative
    // 2. overlapping window (tune detection algo
    
    

        // if(index = NUM_SAMPLES) {
        //     //some lpf+derivative function
        //     index = 0;
        // }
        // else {
        //     field_strength_array[index] = field_strength;
        // }

        printk("X: %d\n", (int)x_uT);
        printk("Y: %d\n", (int)y_uT);
        printk("Z: %d\n", (int)z_uT);
        printk("OVR: %d\n", (int)field_strength);

        k_msleep(100);
    }



}

return 0;
}

