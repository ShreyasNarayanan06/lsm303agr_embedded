typedef enum {
    init,
    high,
    low,
    done,
    current = init
} State;

void sig_proc(float fs[], float fssp[]);

void lpf(float fs[], float fslpf[]);

void derivative(float fslpf[], float fssp[]);

int condenser(float fssp[]);

State cap_decision(float fssp[], State current);