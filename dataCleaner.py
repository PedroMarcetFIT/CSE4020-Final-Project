f = open("CompanyData.csv", "r").read().split("\n")
out = [f[0]]
for j in f[1:]:
    temp = j.split(",")
    for i in range(3,6):
        t = temp[i].split("/")
        t[0] = "0"*(2-len(t[0]))+t[0]
        t[1] = "0"*(2-len(t[1]))+t[1]
        temp[i] = f"{t[2]}-{t[0]}-{t[1]}"
    out.append(",".join(temp))
o = open("CompanyDataCleaned.csv", "w")
o.write("\n".join(out))
