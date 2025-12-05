data = open("CompanyDataCleaned.csv", "r").read()[1:].split("\n")
table = []
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
    table.append(temp)
f = {i:[] for i in d0}
for i, v in enumerate(d0):
    for ii, vv in enumerate(d0):
        if i == ii:
            continue
        mapping = {}
        for j in table:
            a = j[i]
            b = j[ii]
            if a in mapping and mapping[a] != b:
                break
            mapping[a] = b
        else:
            f[v].append(vv)

#print("f = ", f, "\n")
combos = {}
inCombo = {}
for i, v in enumerate(d0):
    if v not in inCombo:
        inCombo[v] = True
        combos[v] = [v]
        for ii, vv in enumerate(d0):
            if vv not in inCombo and vv in f[v] and v in f[vv]:
                inCombo[vv] = True
                combos[v].append(vv)
                
#print("combos = ", combos, "\n")
d1 = [",".join(combos[i]) for i in combos]
d1ToCombo = {",".join(combos[i]):i for i in combos}
ComboTod1 = {i:",".join(combos[i]) for i in combos}
f1 = {}
for i in f:
    if i in ComboTod1:
        temp = f[i]
        f1[ComboTod1[i]] = temp
#print("f1 = ", f1, "\n")
f2 = {}
for j in f1:
    f2[j] = []
    for i in f1[j]:
        if i in ComboTod1:
            f2[j].append(ComboTod1[i])
#print("f2 = ", f2, "\n")
for i, v in enumerate(d1):
    for ii, vv in enumerate(d1):
        if vv in f2[v]:
            for j in d1:
                if j in f2[vv] and j in f2[v]:
                    f2[v].remove(j)
#print("f3 = ", f2, "\n")
f4 = {i:f2[i] for i in f2 if f2[i] != [] or i.count(",") != 0}
#print("f4 = ", f4, "\n")
f5 = {i:[d1ToCombo[j] if j in d1ToCombo else j for j in f4[i]] for i in f4}
#print("f5 = ", f5, "\n")
used = {}
for i in f5:
    for j in f5[i]:
        used[j] = True
#print("used = ", used, "\n")
full = [i for i in d0 if i in combos]
#print("full = ", full, "\n")
fullcut = [i for i in full if i not in used]
#print("fullcut = ", fullcut, "\n")
tables = [",".join(fullcut)]
for i in f5:
    tables.append(",".join([i]+f5[i]))
tables2 = [tables[0]]
seen = {i:True for i in tables[0]}
for i in tables[1:]:
    sp = i.split(",")
    temp = [sp[0]]
    for j in sp[1:]:
        if j not in seen:
            temp.append(j)
            seen[j] = True
    if len(sp) > 1:
        tables2.append(",".join(sp))
#for i in tables:
#    print(i)
#print("_"*30)
for c, i in enumerate(tables2):
    #print(i)
    print(f"CREATE TABLE {i.split(',')[0] if c != 0 else 'base'}Stuff AS SELECT {i} FROM OGDataTable;", end="")





