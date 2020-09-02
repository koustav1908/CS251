def rotate(m):
	n=len(m)
	matrix=[]
	for i in range(0,n):
		j=n-1
		a=[]
		while j>=0:
			a.append(m[j][i])
			j=j-1;
		matrix.append(a)
	return matrix
l=1
matrix=[]
i=0
while i < l:
	a=list(map(int, input().split()))
	matrix.append(a);
	l=len(a)
	i=i+1

matrix_90=rotate(matrix)

for i in range(0,l):
	for j in range(0,l):
		print(matrix_90[i][j], end=" ")
	print()
