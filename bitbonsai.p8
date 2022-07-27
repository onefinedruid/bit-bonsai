pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--init
function init()
sec=stat(95)
nsec=0
hour=0
day=0
year=0
date=""
rootx=60
rooty=80
selx=rootx
sely=rooty



end
init()
-->8
--draw
function _draw()
cls(12)
map(0,0,28,32,64,64,1)
print("y" ..tostr(year), 28, 32, 12)
print("d" ..tostr(day), 40, 32, 14)
print(hour,93,32,0)
palt(6,true)

--debug
print(sec, 0, 0, 0)
print(nsec, 0, 8, 0)

print("x:"..tostr(selx), 0,16,0)
print("y:"..tostr(sely), 16,16,0)

--cursor movement
if btn(0) then selx=selx-1 end
if btn(1) then selx=selx+1 end
if btn(2) then sely=sely-1 end
if btn(3) then sely=sely+1 end

--basic growth
if day>=5 then
  spr(7,rootx,rooty)
  --trim
  if selx==rootx and sely==rooty then
    print("trim?",56,32,0)
    if btn(5) then
      trimroot()
    end
  end
end

if day>=15 then
  spr(42,rootx,rooty-8)
  end
if day>=25 then
  spr(9,rootx,rooty-8)
  spr(8,rootx-8,rooty-8)
  spr(10,rootx+8,rooty-8)
  end
  
--cursor
spr(17,selx,sely)
if selx<28 then selx=28
		elseif sely<32  then sely=32
		end
if selx>92 then selx=92
		elseif sely>88 then sely=88
		end



end
_draw()
-->8
--update
function _update()

-- clock		
		nsec=stat(95)
		if nsec==0 then sec=0 end
		if hour==25 then hour=0 end
		if sec<nsec then
		  sec=sec+1
		  hour=hour+1
		  if hour==24 then 
		    day=day+1
		  end
		end
		if day>365 then
		  year=year+1
		  day=0
		end
		
-- seasons		
	--[[	if day>=0 and day<91 then
		  cls(14) end
		if day>91 and day<183 then
		  cls(12) end
		if day>183 and day<274 then
		  cls(9) end
		if day>274 then
		  cls(7) end]]--
		

end

-->8
--0ther functions
function trimroot()
spr(6,rootx,rooty)
end
__gfx__
00000000ffffffff44444444fffffffffffffffffffffffffff44fff34344ffffffffffffff44ffffffffffffffffffff333333fffffffff0000000000000000
00000000ffffffff44444444fffffffffffffffffffffffffff44ffff3444343fffff33ffff44fffffffffffffffffff33333333ffffffff0000000000000000
00000000ffffffff44444444fffffffffffffffffffffffffff44ffffff4443ffff33343fff44fffffffffffffffffff33333333ffffffff0000000000000000
00000000ffffffff44444444fffffffffffffffffffffffffff44ffffff44fffff33333344444fffffffffffffffffff33333333ffffffff0000000000000000
00000000ffffffff444444442222222222222222222222222222222222222222fff3333fff444ffff33fffffffffffff33333333ffffffff0000000000000000
00000000ffffffff444444442222222222222222222222222222222222222222fffffffffff44fff34333fffffffffff33333333ffffffff0000000000000000
00000000ffffffff44444444f2222222222222222222222f2222222222222222fffffffffff44444333333ffffffffff33333333ffffffff0000000000000000
00000000ffffffff44444444fff222ffffffffffff222ffffffffffffffffffffffffffffff444fff3333ffffffffffff334433fffffffff0000000000000000
000000007777777700000000000000000000000000000000fff44ffff4f44ffffffffffffff44ffffffffffff333333ff334433ff333333f0000000000000000
000000007666666700000000000000000000000000000000fff44fffff444f4ffff333fffff44fffff333fff3333333333333333333333330000000000000000
000000007666666700000000000000000000000000000000fff44ffffff444ffff33333ffff44ffff33333ff3333333333333333333333330000000000000000
000000007666666700000000000000000000000000000000fff44ffffff44ffff3333443444444443443333f3333333333333333333333330000000000000000
000000007666666700000000000000000000000000000000fff44fff22222222f3333343ff4444ff3433333f3333444333333333344433330000000000000000
000000007666666700000000000000000000000000000000fff44fff22222222ff33333fff3333fff33333ff3333334444333344443333330000000000000000
000000007666666700000000000000000000000000000000fff44fff22222222ffff33fff333333fff33ffff3333333333444433333333330000000000000000
000000007777777700000000000000000000000000000000fff44fffffffffffffffffffff3333fffffffffff333333ff334433ff333333f0000000000000000
0000000000000000000000000000000000000000000000000000000000000000fffffffffff44fff343ff343fffffffff44ff44fffffffff0000000000000000
0000000000000000000000000000000000000000000000000000000000000000fffffffffff44ffff344443fffffffffff4444ffffffffff0000000000000000
0000000000000000000000000000000000000000000000000000000000000000ffffffff33344ffffff44ffffffffffffff44fffffffffff0000000000000000
0000000000000000000000000000000000000000000000000000000000000000ffffffff34344ffffff44ffffffffffffff44fffffffffff0000000000000000
0000000000000000000000000000000000000000000000000000000000000000ff3333ff33444fff33344333ffff444ffff44fffff444fff0000000000000000
0000000000000000000000000000000000000000000000000000000000000000f333433ffff4433344344344ffffff4444444444444fffff0000000000000000
000000000000000000000000000000000000000000000000000000000000000033343333fff4434333444433ffffffffff4444ffffffffff0000000000000000
0000000000000000000000000000000000000000000000000000000000000000ff3333fffff44433fff44ffffffffffffff44fffffffffff0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101010101010100000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101010101010100000000000000000
__gff__
0001010303030404040404040404000000800000000004040404040404040000000000000000000000040404040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010304050101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
