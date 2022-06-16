m = Map("oled", translate("OLED"), translate("Tích hợp màn hình oled display (SSD1306, 0.91', 128X64) cho OpenWrt.<br /> Được Kênh Táy Máy sửa lại từ dự án: ")..[[<a href="https://github.com/natelol/luci-app-oled" target="_blank">luci-app-oled</a>]])

--m.chain("luci")

m:section(SimpleSection).template="oled/status"

s = m:section(TypedSection, "oled", translate(""))
s.anonymous=true
s.addremove=false

--OPTIONS
s:tab("info", translate("Info Display"))
o = s:taboption("info", Flag, "enable", translate("Enable"))
o.default=0
o = s:taboption("info", Flag, "autoswitch", translate("Enable Auto switch"))
o.default=0
from = s:taboption("info", ListValue, "from", translate("From"))
to = s:taboption("info", ListValue, "to", translate("To"))
for i=0,23 do
	for j=0,30,30 do
		from:value(i*60+j,string.format("%02d:%02d",i,j))
		to:value(i*60+j,string.format("%02d:%02d",i,j))
	end
end
from:value(1440,"24:00")
to:value(1440,"24:00")
from:depends("autoswitch",'1')
to:depends("autoswitch",'1')
from.default=0
to.default=1440

--informtion  options----
o = s:taboption("info", Value, "speedtesttime", translate("Speedtest interval(s)"), translate('Speedtest will run in set seconds'))
o.default=900

return m

---
