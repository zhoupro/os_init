from urllib.request import urlretrieve
import os,sys
cur = 1
def Schedule(a,b,c):
    '''''
    a:已经下载的数据块
    b:数据块的大小
    c:远程文件的大小
   '''
    global cur
    per =  100 * a * b / c
    if per > 100 :
        per = 100

    if per > cur:
        sys.stdout.write("*")
        sys.stdout.flush()
        cur = cur + 2


def download(url,name,basepath=os.getcwd()+'/'):
    local = os.path.join(basepath,name)
    urlretrieve(url,local,Schedule)


