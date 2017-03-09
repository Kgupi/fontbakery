FROM python:2.7

RUN apt-get update
RUN apt-get install -y mono-complete
RUN apt-get install -y git-core

ADD requirements.txt /
RUN pip install --no-cache-dir -r requirements.txt

ADD data/test/mada/*.ttf /test/
COPY prebuilt /prebuilt
ADD fontbakery-check-ttf.py /
ADD fontbakery-gather-dashboard-data-from-git.py /

CMD ["python2", "fontbakery-gather-dashboard-data-from-git.py"]