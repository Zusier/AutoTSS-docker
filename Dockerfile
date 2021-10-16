FROM python:3.9

WORKDIR /app

RUN pip3 install --no-cache-dir install \
  aioify \
  aiofiles \
  aiosqlite \
  discord.py \
  remotezip \
  && git clone --depth=1 https://github.com/m1stadev/AutoTSS .

COPY ./tsscheck /usr/local/bin/tsschecker
RUN chmod +x /usr/local/bin/tsschecker && chmod 555 /usr/local/bin/tsschecker

CMD ["python3", "bot.py"]
