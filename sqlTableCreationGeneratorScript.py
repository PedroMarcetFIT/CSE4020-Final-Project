data = open("CompanyDataCleaned.csv", "r").read().split("\n")
out = []
d0 = data[0].split(",")
d1 = data[1].split(",")
tp = ["INT", "DATETIME", "FLOAT", "VARCHAR(255)"]
for i, v in enumerate(d0):
    typ = 0
    try:
        int(d1[i])
    except:
        if len(d1[i].split("-")) == 3:
            typ = 1
        elif len(d1[i].split(".")) == 2 and d1[i][-1] != ".":
            typ = 2
        else:
            typ = 3
    v = v.replace(".", "_")
    out.append(f"{v} {tp[typ]}")
#id INT,
#name VARCHAR(255),
#revenue FLOAT,
#created_at DATETIME
print("CREATE TABLE OGDataTable ("+(",".join(out))+");")
