def odstranisam(niz):
    nov=""
    for i in range(0,len(niz),1):
        if niz[i] not in ["a","e","i","o","u"]:
            nov=nov+niz[i];
    print(nov)

odstranisam("avtobus")