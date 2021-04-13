

## 1. Copy m3u8 link

![Alt text](https://monosnap.com/file/s0hXFdzKJnwy3v21yIJ6pF1Fsg0TGz.png)

## 2. Run command

```
echo "Enter m3u8 link:";read link;echo "Enter output filename:";read filename;ffmpeg -i "$link" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 $filename.mp4
```

![Alt text](https://monosnap.com/file/CyH7xQt1FpZeHPFKQIx4HkMljjMBSP.png)

**Example final command**

```
ffmpeg -i "http://host/folder/file.m3u8" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 file.mp4
```
