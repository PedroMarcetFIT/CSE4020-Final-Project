data = open("CompanyDataCleaned.csv", "r").read()[1:].split("\n")
out = []
data[0] = data[0].replace(".", "_")
d0 = data[0].split(",")
types=[]
for d1 in data[1].split(","):
    typ = 0
    try:
        int(d1)
    except:
        if len(d1.split("-")) == 3:
            typ = 1
        elif len(d1.split(".")) == 2 and d1[-1] != ".":
            typ = 0
        else:
            typ = 1
    types.append(typ)
for v in data[1:]:
    temp = []
    stk = [[]]
    quots = 1
    for i in v:
        if i == '"':
            quots = 1-quots
        if i == "'":
            stk[-1].append("\\"+i)
        elif i == ',' and quots:
            stk[-1] = "".join(stk[-1])
            stk.append([])
        else:
            stk[-1].append(i)
    stk[-1] = "".join(stk[-1])
    for c, j in enumerate(stk):
        st = j
        if types[c]:
            st = f"'{st}'"
        temp.append(st)
    da = ",".join(temp)
    out.append(f"({da})")
print("INSERT INTO OGDataTable (" + data[0] + ") VALUES " + ", ".join(out) +";")
