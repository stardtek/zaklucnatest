def izbrisSAM(niz):
    nov = ""
    for i in range(len(niz)):
        if(niz[i] not in "aeiuo"):
            nov += niz[i]
    print(nov)
izbrisSAM("testiram nalogo")