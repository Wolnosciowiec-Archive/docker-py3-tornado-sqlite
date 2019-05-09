Base container for Python 3 Tornado applications
================================================

Features:
- A standard user of uid=82, gid=82 (Alpine standard WWW user)
- Python 3.7 with: requests, tornado, sqlite3
- SQLite3 client in CLI
- curl in CLI
- sudo

## Building and running

Use just `make`, check also images on docker hub at https://cloud.docker.com/repository/docker/wolnosciowiec/docker-py3-tornado-sqlite

```shell
➜  docker-py3-tornado-sqlite git:(master) ✗ make
sudo docker build . -t py3-torando
Sending build context to Docker daemon  109.6kB
Step 1/4 : FROM python:3.7-alpine
 ---> cd2b35632442
Step 2/4 : RUN pip install -U tornado requests pysqlite3     && apk --update add sqlite curl sudo     && addgroup -g 82 -S app     && adduser -u 82 -D -S -G app app
 ---> Running in 2b8158215149
Collecting tornado
  Downloading https://files.pythonhosted.org/packages/03/3f/5f89d99fca3c0100c8cede4f53f660b126d39e0d6a1e943e95cc3ed386fb/tornado-6.0.2.tar.gz (481kB)
Collecting requests
  Downloading https://files.pythonhosted.org/packages/7d/e3/20f3d364d6c8e5d2353c72a67778eb189176f08e873c9900e10c0287b84b/requests-2.21.0-py2.py3-none-any.whl (57kB)
Collecting pysqlite3
  Downloading https://files.pythonhosted.org/packages/83/31/42af47b96c435d956e8eef5d65f0a2cc21205ae67cd8d4319d467314aef7/pysqlite3-0.2.1.tar.gz
Collecting certifi>=2017.4.17 (from requests)
  Downloading https://files.pythonhosted.org/packages/60/75/f692a584e85b7eaba0e03827b3d51f45f571c2e793dd731e598828d380aa/certifi-2019.3.9-py2.py3-none-any.whl (158kB)
Collecting idna<2.9,>=2.5 (from requests)
  Downloading https://files.pythonhosted.org/packages/14/2c/cd551d81dbe15200be1cf41cd03869a46fe7226e7450af7a6545bfc474c9/idna-2.8-py2.py3-none-any.whl (58kB)
Collecting urllib3<1.25,>=1.21.1 (from requests)
  Downloading https://files.pythonhosted.org/packages/01/11/525b02e4acc0c747de8b6ccdab376331597c569c42ea66ab0a1dbd36eca2/urllib3-1.24.3-py2.py3-none-any.whl (118kB)
Collecting chardet<3.1.0,>=3.0.2 (from requests)
  Downloading https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl (133kB)
Building wheels for collected packages: tornado, pysqlite3
  Building wheel for tornado (setup.py): started
  Building wheel for tornado (setup.py): finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/61/7e/7a/5e02e60dc329aef32ecf70e0425319ee7e2198c3a7cf98b4a2
  Building wheel for pysqlite3 (setup.py): started
  Building wheel for pysqlite3 (setup.py): finished with status 'done'
  WARNING: Legacy build of wheel for 'pysqlite3' created no files.
  Command arguments: /usr/local/bin/python -u -c 'import setuptools, tokenize;__file__='"'"'/tmp/pip-install-4w4fgpom/pysqlite3/setup.py'"'"';f=getattr(tokenize, '"'"'open'"'"', open)(__file__);code=f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' bdist_wheel -d /tmp/pip-wheel-cyqmbijt --python-tag cp37
  Command output: [use --verbose to show]
  Running setup.py clean for pysqlite3
Successfully built tornado
Failed to build pysqlite3
Installing collected packages: tornado, certifi, idna, urllib3, chardet, requests, pysqlite3
  Running setup.py install for pysqlite3: started
    Running setup.py install for pysqlite3: finished with status 'done'
Successfully installed certifi-2019.3.9 chardet-3.0.4 idna-2.8 pysqlite3 requests-2.21.0 tornado-6.0.2 urllib3-1.24.3
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/x86_64/APKINDEX.tar.gz
(1/6) Installing nghttp2-libs (1.35.1-r0)
(2/6) Installing libssh2 (1.8.2-r0)
(3/6) Installing libcurl (7.64.0-r1)
(4/6) Installing curl (7.64.0-r1)
(5/6) Installing sqlite (3.26.0-r3)
(6/6) Installing sudo (1.8.25_p1-r2)
Executing busybox-1.29.3-r10.trigger
OK: 21 MiB in 41 packages
Removing intermediate container 2b8158215149
 ---> 2c701c7d459d
Step 3/4 : USER app
 ---> Running in 9eb9404d686a
Removing intermediate container 9eb9404d686a
 ---> 5b5b3bca7a71
Step 4/4 : ENTRYPOINT python
 ---> Running in 6a9fa710f7e4
Removing intermediate container 6a9fa710f7e4
 ---> 7ba63b6954e4
Successfully built 7ba63b6954e4
Successfully tagged py3-torando:latest
sudo docker run --rm -it py3-torando:latest
Python 3.7.3 (default, Apr 10 2019, 01:29:41) 
[GCC 8.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
>>> os
<module 'os' from '/usr/local/lib/python3.7/os.py'>
>>> 
>>> os.system('id')
uid=82(app) gid=82(app) groups=82(app)
0
>>> 
```
