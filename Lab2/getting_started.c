int main () {
	int a[5] = {1,20,3,4,5};
	int max_val = 0;
	//TODO- Fill this in
	
	int i;
	for (i = 0; i < 5; i++){
		if (max_val > a[i]){
			max_val = max_val; // uncessary
		}else{
			max_val = a[i];	
		}
	}
	printf ("%d",max_val);
	return max_val;
}



