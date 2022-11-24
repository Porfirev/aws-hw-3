#include<stdio.h>

const double EPS = 1e-6;

double f(double a, double b, double x) {
	return a + b * x * x * x;
}

double integral(double a, double b, double left, double right) {
	double step = EPS;
	double now = left;
	double res = 0;
	while (now + step < right) {
		res += f(a, b, now) * step; // с недостатком
		now += step;
	}
	return res;
}

int main() {
	printf("y = a + bx^3\n");
	double a, b;
	double left, right;
	printf("a = ");
	scanf("%lf", &a);
	printf("b = ");
	scanf("%lf", &b);
	printf("Две границы интегрирования (по модулю до 100):\n");
	printf("left = ");
	scanf("%lf", &left);
	printf("right = ");
	scanf("%lf", &right);
	printf("integral = %lf\n", integral(a, b, left, right));
}
