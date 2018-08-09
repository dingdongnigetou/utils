
# for centos7

echo "### install ###"
yum install -y python-pip python-wheel python-setuptools
pip install --upgrade pip
pip install shadowsocks

echo "### config ###"
echo "
{
	"server":"0.0.0.0",
	"server_port":443,
	"local_address": "127.0.0.1",
	"local_port":1080,
	"password":"put your password here"
	"timeout":300,
	"method":"aes-256-cfb"
}
" >/etc/shadowsocks.json

echo "### firewall ###"
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --reload

echo "### start ###"
ssserver -c /etc/shadowsocks.json -d start

