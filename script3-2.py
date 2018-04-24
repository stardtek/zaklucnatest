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
    
pras("rat","tar")