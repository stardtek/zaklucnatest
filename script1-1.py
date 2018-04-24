def pras(n):
    st = 0
    for i in range(1,n+1):
        st1 = 0
        for j in range(1,i+1):
            if(i % j == 0):
                st1+=1
        if(st1 == 2):
            st+=1
    print(st)
    
pras([1,2,3,4,5,6,7,8,9,10,0])