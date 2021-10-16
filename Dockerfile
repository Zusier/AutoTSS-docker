FROM python:3.9-slim

WORKDIR /app

RUN pip3 install --no-cache-dir install \
  aioify \
  aiofiles \
  aiosqlite \
  discord.py \
  remotezip \
  && apt-get update \
  && apt-get install -y git \
  && git clone --depth=1 https://github.com/m1stadev/AutoTSS . \
  && rm -rf /var/lib/apt/lists/* /var/tmp* /tmp/*

COPY ./tsschecker_linux_x86_64 /usr/local/bin/tsschecker
RUN chmod +x /usr/local/bin/tsschecker && chmod 555 /usr/local/bin/tsschecker

CMD ["python3", "bot.py"]
