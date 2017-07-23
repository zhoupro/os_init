#from version import getOnlineVersion
from downhelper import download
import subprocess
import argparse

def getIdeaProductCodeByName(name='phpstorm'):
    idea_array = {
        'phpstorm':'PS',
        'datagrip':'DG',
        'clion': "CL",
        'webstorm': "WS",
        'pycharm':"PCP",
        'idea':'IIU',
        'gogland':'GO',
        'rubymine':'RM',
    }
    return idea_array[name]


def getLocalVersion(name='phpstorm'):
    file = '/opt/soft/dev/idea/'+name+'/build.txt'
    version = open(file).readline()
    slash_pos =version.index("-")+1
    print(version[slash_pos:])


def getDownloadurl(name='phpstorm',platform='linux'):
    code = getIdeaProductCodeByName(name)
    url = 'https://data.services.jetbrains.com/products/download?code='+code+'&platform='+platform;
    return url



def installIde(name='phpstorm'):
    print("installing "+name)
    url = getDownloadurl(name)
    download(url,name+'.tar.gz')
    subprocess.call("tar xzvf " +name+'.tar.gz', shell=True)
    p=subprocess.Popen("ls | grep -i "+name+" | grep -v '"+name+".tar.gz'", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (stdoutput,erroutput) = p.communicate()
    idestr=stdoutput.decode().strip()
    subprocess.call("mv "+idestr+" "+name, shell=True)
    subprocess.call("mkdir -p  /opt/soft/dev/idea/", shell=True)
    subprocess.call("mv "+name+" /opt/soft/dev/idea/"+name, shell=True)
    print("install "+name+"success")
    print(getLocalVersion(name))


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--soft', help='要安装的软件名称', default='phpstorm')
args = parser.parse_args()


installIde(args.soft)
















