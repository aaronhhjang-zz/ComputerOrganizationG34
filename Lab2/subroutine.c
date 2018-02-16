extern int MAX_2 (int x, int y);

int main() {

	int max_val = 0; 

	int a[5] = {1,20,3,4,5};

	int i;
	for (i = 0; i < 5; i++){
		max_val = MAX_2(max_val,a[i]);

	}

	return max_val;
}
