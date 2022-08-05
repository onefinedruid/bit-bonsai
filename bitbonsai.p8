pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--init
function init()
poke(0x5f2c,3)
version="0.2.0"
sec=stat(95)
nsec=0
hour=0
day=0
year=0
date=""
mapx=0
rootx=24
rooty=48
selx=rootx
sely=rooty
flag1,flag2,flag3,flag4,flag5=
true,true,true,true,true
root_spr=7
trunk_spr=12
topcenter=40
llbranch=11
lrbranch=13

--music(10)

--eof
end
init()
-->8
--draw
function _draw()


--map
function drawmap()
		map(mapx,0,0,0,64,64,1)
		print("hour "..tostr(hour),0,0,7)
		print("day " ..tostr(day),0,6,3)
		print("year " ..tostr(year),0,12,2)
end

function trimtext()
		print("trim?",31,0,7) 
end

palt(6,true)
drawmap()

--version
--print(version,30,0,10)

--debug
--print("x:"..tostr(selx),0,18,7)
--print("y:"..tostr(sely),0,24,7)

--daylight
  if hour>=0 and hour<6 then
    pal(15,1)
    end
  if hour>=6 and hour<12 then
    pal(15,9)
    end
		if hour>=12 and hour<18 then
    pal(15,12)
    end
  if hour>=18 and hour<22 then
    pal(15,14)
    end
  if hour>=22 and hour<23 then
    pal(15,13)
    end
  if hour>=23 then
    pal(15,1)
    end  
		
--tree growth

if year==0 then
--day 2
if day>=2 then
  spr(root_spr,rootx,rooty)
  --trim
  if flag1==true then
		  if selx==rootx and sely==rooty then
		    trimtext()
		    if btnp(5) then
		      if root_spr==7 then 
		        root_spr=23
		      elseif root_spr==23 then 
		        root_spr=6
		        flag1=false
		      end
		    end
		  end
  end
end

--day 5
if day>=5 then
  spr(42,rootx,rooty-8)
end

--day 10
if day>=10 then
  spr(9,rootx,rooty-8)
  spr(8,rootx-8,rooty-8)
  spr(10,rootx+8,rooty-8)
  spr(topcenter,rootx,rooty-16)
end
  
--day 15 
if day>=15 then
  spr(topcenter,rootx,rooty-16)
  spr(llbranch,rootx-8,rooty-8)
  spr(trunk_spr,rootx,rooty-8)
  spr(lrbranch,rootx+8,rooty-8)
  if topcenter==40 then topcenter=12 end
  --trim
  if flag2==true then
		  if selx==rootx and sely==(rooty-8) then
		    trimtext()
		    if btnp(5) then
		      if trunk_spr==12 then 
		        trunk_spr=9
		        flag2=false
		      end
		    end
		  end
		end
		if flag3==true then
		  if selx==rootx and sely==(rooty-16) then
		    trimtext()
		    if btn(5) then
		      if topcenter==12 then
		        topcenter=42
		        flag3=false
		      end
		    end
		  end
  end
  if flag4==true then
		  if selx==rootx-8 and sely==(rooty-8) then
		    trimtext()
		    if btn(5) then
		      if llbranch==11 then
		        llbranch=24
		        flag4=false
		      end
		    end
		  end
  end
  if flag5==true then
		  if selx==rootx+8 and sely==(rooty-8) then
		    trimtext()
		    if btn(5) then
		      if lrbranch==13 then
		        lrbranch=26
		        flag5=false
		      end
		    end
		  end
  end            
end

--day 20
if day>=20 then
  if flag3==false then
		  topcenter=9
				spr(8,rootx-8,rooty-16)
				spr(10,rootx+8,rooty-16)
				spr(40, rootx,rooty-24)
		end 
end


end -- year wrapper

--cursor
spr(17,selx,sely)
if selx<0 then selx=0
		elseif sely<0  then sely=0
		end
if selx>56 then selx=56
		elseif sely>56 then sely=56
		end
if selx==0 and sely<1 then
  sely=0
  end
if selx>=64 and sely>56 then
 sely=56
 end


--debug
--print(sec, 0, 0, 0)
--print(nsec, 0, 8, 0)

--eof
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
		  if hour>24 or hour==0 then 
		    day=day+1
		  end
		end
		if day>365 then
		  year=year+1
		  day=0
		end
		
		  
--cursor movement
		if btn(0) then selx=selx-1 end
		if btn(1) then selx=selx+1 end
		if btn(2) then sely=sely-1 end
		if btn(3) then sely=sely+1 end
		
--eof
end

-->8
--0ther functions

__gfx__
00000000ffffffff44444444fffffffffffffffffffffffffff44fff34344ffffffffffffff44ffffffffffff333333ff333333ff333333f0000000000000000
00000000ffffffff44444444fffffffffffffffffffffffffff44ffff3444343fffff33ffff44fffffffffff3333333333333333333333330000000000000000
00000000ffffffff44444444fffffffffffffffffffffffffff44ffffff4443ffff33343fff44fffffffffff3333333333333333333333330000000000000000
00000000ffffffff44444444fffffffffffffffffffffffffff44ffffff44fffff33333344444fffffffffff3333333433333333333333330000000000000000
00000000ffffffff444444442222222222222222222222222222222222222222fff3333fff444ffff33fffff3333443333333333333433330000000000000000
00000000ffffffff444444442222222222222222222222222222222222222222fffffffffff44fff34333fff3333333333333333344333330000000000000000
00000000ffffffff44444444f2222222222222222222222f2222222222222222fffffffffff44444333333ff3333333333333333333333330000000000000000
00000000ffffffff44444444fff222ffffffffffff222ffffffffffffffffffffffffffffff444fff3333ffff333333ff334433ff333333f0000000000000000
cccccccc7777777777777775777777750000000000000000fff44ffff4f44ffffffffffffff44ffffffffffff333333ff334433ff333333f0000000000000000
cccccccc766666677555555d7555555d0000000000000000fff44fffff444f4ffff333fffff44fffffffffff3333333333333333333333330000000000000000
cccccccc76666667755c555d7558585d0000000000000000fff44ffffff444ffff33333ffff44fffffffffff3333333333333333333333330000000000000000
cccccccc76666667755cc55d7555755d0000000000000000fff44ffffff44ffff333344344444fffff333fff3333333333333333333333330000000000000000
cccccccc7666666775cccc5d7557575d0000000000000000fff44fff22222222f3333343ff444ffff33333ff3333444333333333344433330000000000000000
cccccccc76666667755cc55d7557575d0000000000000000fff44fff22222222ff33333fff3333443443333f3333334444333344443333330000000000000000
cccccccc766666677555555d7555555d0000000000000000fff44fff22222222ffff33fff333333f3433333f3333333333444433333333330000000000000000
cccccccc777777775ddddddd5ddddddd0000000000000000fff44fffffffffffffffffffff3333fff33333fff333333ff334433ff333333f0000000000000000
eeeeeeee7777777777777775ffffffff00000000000000000000000000000000fffffffffff44fff343ff343fffffffff44ff44fffffffff0000000000000000
eeeeeeee777777777555555dffaaaaff00000000000000000000000000000000fffffffffff44ffff344443fffffffffff4444ffffffffff0000000000000000
eeeeeeee777777777535355dfaaaaaaf00000000000000000000000000000000ffffffff33344ffffff44ffffffffffffff44fffffffffff0000000000000000
eeeeeeee777777777553535dfaaaaaaf00000000000000000000000000000000ffffffff34344ffffff44ffffffffffffff44fffffffffff0000000000000000
eeeeeeee777777777535355dfaaaaaaf00000000000000000000000000000000fff333ff33444fff33344333ffff444ffff44fffff444fff0000000000000000
eeeeeeee777777777553535dfaaaaaaf00000000000000000000000000000000ff33333ffff4433344344344ffffff4444444444444fffff0000000000000000
eeeeeeee777777777555555dffaaaaff00000000000000000000000000000000f333433ffff4434333444433ffffffffff4444ffffffffff0000000000000000
eeeeeeee777777775dddddddffffffff00000000000000000000000000000000ff3433fffff44433fff44ffffffffffffff44fffffffffff0000000000000000
99999999555555557777777500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999555555557555555d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999999955555555755ee55d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
999999995555555575eaae5d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999999955555555755ee55d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999555555557555355d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999555555557553535d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999555555555ddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
aaaeeeeeaaeeeeeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
aeaeeeeeeaeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
aeaeeeeeeaeeeeeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
aeaeeeeeeaeeeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
aaaeeaeeaaaeeaeeaaaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee5f5ff55f5f5f555fffff55ff5f5fffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee5f5f5f5f5f5f5f5ffffff5ff5f5fffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee555f5f5f5f5f55fffffff5ff555fffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee5f5f5f5f5f5f5f5ffffff5ffff5fffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee5f5f55fff55f5f5fffff555fff5fffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeffeeefefefffffeeefeeefffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeefefefefefefffffefefefefffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeefefeeefeeefffffeeefefefffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeefefefefffefffffffefefefffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeefefefeeefffffffefeeefffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeecfcfcccfcccfcccfffffcccfffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeecfcfcfffcfcfcfcfffffcfcfffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeecccfccffcccfccffffffcfcfffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffcfcfffcfcfcfcfffffcfcfffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeecccfcccfcfcfcfcfffffcccfffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff77777777fffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff7ffffff7fffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff7ffffff7fffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff7ffffff7ffffffff333333fffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff7ffffff7fffffff33333333ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff7ffffff7fffffff33333333ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff7ffffff7fffffff33333333ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffff77777777fffffff33333333ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffff33333333ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffff33333333ffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffffffffffff334433fffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffff333333ff44ff44ff333333fffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff33333333ff4444ff33333333ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff33333333fff44fff33333333ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff33333333fff44fff33333333ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff33334443fff44fff34443333ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff333333444444444444333333ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff33333333ff4444ff33333333ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffff333333ffff44ffff333333fffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffffffffffff4f44fffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffffff444f4fffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffffffffffffff444ffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffffffffffffff44fffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff222222222222222222222222ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffff222222222222222222222222ffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffff2222222222222222222222fffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeefffffffffffffffffffffffffff222ffffffffffff222fffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeee444444444444444444444444444444444444444444444444444444444444444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

__gff__
0101010303030404040404040404000001800101000004040404040404040000010101010000000000040404040400000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010113000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010112000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101230122000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010132000000000000000000002020010101010101010101202020201010101001010101010101010110101010303030300101010101010101013030303021212121010101010101010101212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010101000000000000000000002020010101010101010101202020201010101001010101010101010110101010303030300101010101010101013030303021212121010101010101010101212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101000000000000000000002020010101010101010101202020201010101001010101010101010110101010303030300101010101010101013030303021212121010101010101010101212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101030405010101000000000000000000002020010101010101010101202020201010101001010101010101010110101010303030300101010101010101013030303021212121010101010101010101212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202000000000000000000002020010101010101010101202020201010101001010101010101010110101010303030300101010101010101013030303021212121010101010101010101212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002020010101010101010101202020201010101001010101010101010110101010303030300101010101010101013030303021212121010101010101010101212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002020010101030405010101202020201010101001010103040501010110101010303030300101010304050101013030303021212121010101030405010101212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002020020202020202020202202020201010101002020202020202020210101010303030300202020202020202023030303021212121020202020202020202212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000160d5500d5500e5500e5500f55010550125501a5501a5501a5501b5501b5501b5501b5501a5501955018550175501655015550145501455000000000000000000000000000000000000000000000000000
001000152e5402854026540255402554024540245402454024540245402455000050305502f5502e5502d5502c5502c5502c5502b5502b5500000000000000000000000000000000000000000000000000000000
__music__
02 01024344

