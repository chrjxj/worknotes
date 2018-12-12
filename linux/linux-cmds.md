# Linux Commands #



#### folder stats

find . -type f |xargs wc -l

# 一次性删除某目录及其子目录下所有的exe文件。
find . -name '*.exe' -type f -print -exec rm -rf {} \;

du -sh

ls -lh

df -h


#### tar and zip

tar and zip

1) Extract a tar.gz archive

tar -xvzf bigfile.tar.gz
x –  Extract files
v – Verbose, print the file names as they are extracted one by one
z – The file is a “gzipped” file
f – Use the following tar archive for the operation

The below example command will create a tar archive file tecmint-14-09-12.tar for a directory /home/tecmint in current working directory. See the example command in action.

# tar -cvf filename.tar /path/to/your/folder
c – Creates a new .tar archive file.
v – Verbosely show the .tar file progress.
f – File name type of the archive file.

2. Create tar.gz Archive File
# tar -cvzf MyImages-14-09-12.tar.gz /home/MyImages

#### chmod

chmod X@Y file1 file2 ...:

- X is any combination of the letters `u' (for owner), `g' (for group), `o' (for others), `a' (for all; that is, for `ugo'); 
- @ is either `+' to add permissions, `-' to remove permissions, or `=' to assign permissions absolutely; 
- Y is any combination of `r', `w', `x'. 

Following are some examples:
```
chmod u=rx file        (Give the owner rx permissions, not w)
chmod go-rwx file      (Deny rwx permission for group, others)
chmod g+w file         (Give write permission to the group)
chmod a+x file1 file2  (Give execute permission to everybody)
chmod g+rx,o+x file    (OK to combine like this with a comma)
```




### check system info 

```sudo dmidecode -t 4 | egrep -i "Designation|Intel|core|thread"```

sample results:

```
	Socket Designation: CPU 0
	Core Count: 16
	Core Enabled: 16
	Thread Count: 1
```

```
    	Socket Designation: SOCKET 0
    	Manufacturer: Intel
    		HTT (Multi-threading)
    	Version: Intel(R) Core(TM) i7-6800K CPU @ 3.40GHz
    	Core Count: 6
    	Core Enabled: 6
    	Thread Count: 12
    		Multi-Core
    		Hardware Thread
```    
         
