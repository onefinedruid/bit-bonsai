pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--init
poke(0x5f2c,3)
version="0.3.15"
hour=0
day=0
year=0
sec=stat(95)
nsec=0

function init()
fflag=false
ftool=50
mflag=true
sflag=true
treeage=0 --in days
rootx=24
rooty=48
--growth
flag0,flag1,flag2,flag3,flag4=
false,true,true,true,true
flag5,flag6,flag7,flag8,flag9=
true,true,true,true,true
flag10,flag11,flag12,flag13=
true,true,true,true
flag14,flag15,flag16,flag17=
true,true,true,true
flag18,flag19,flag20,flag21=
true,true,true,true
--lop
flag22,flag23,flag24=
true,true,true
flag25,flag26,flag27=
true,true,true
flag28,flag29,flag30=
true,true,true
flag31,flag32,flag33=
true,true,true
--
root_spr=7
trunk_spr=12
topcenter=40
llbranch=8
lrbranch=10
tlbranch=8
trbranch=10
topcenter2=40
topcenter3=40
ulbranch=8
urbranch=10

end
init()

selx=rootx
sely=rooty
-->8
--draw
function _draw()

function splash()
		spr(54,0,0,8,8)
	 print(version,0,59,10)
end

--map
function drawmap()
		map(0,0,0,0,64,64,1)
		print("hour "..tostr(hour),0,0,7)
		print("day " ..tostr(day),0,6,3)
		print("year " ..tostr(year),0,12,2)
  print("age:"..tostr(treeage),32,0,10)
		spr(ftool,56,24)
end

function trimtext()
		print("trim?",32,6,7) 
end

palt(6,true)
if day==0 and hour<=2 then
  splash()
else
  sflag=false
  drawmap()
end

--debug
--print("x:"..tostr(selx),0,18,7)
--print("y:"..tostr(sely),0,24,7)

--daylight
if sflag==false then
  if hour>=0 and hour<5 then
    pal(15,1)
    spr(51,44,15)
    end
  if hour>=5 and hour<6 then
    pal(15,13)
    spr(51,44,35)
    end
  if hour>=6 and hour<12 then
    pal(15,9)
    spr(35,44,35)
    end
		if hour>=12 and hour<18 then
    pal(15,12)
    spr(35,44,15)
    end
  if hour>=18 and hour<22 then
    pal(15,14)
    spr(35,44,35)
    end
  if hour>=22 and hour<23 then
    pal(15,13)
    spr(51,44,35)
    end
  if hour>=23 then
    pal(15,1)
    spr(51,44,15)
    end
end

--branch lop-----

--age 10
if treeage>=10 then
  if flag28==true then
				if topcenter==40 or topcenter==42 then
				  if selx==rootx and sely==rooty-16 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
						    topcenter=1
						    flag28=false
						  end
				  end
				end
		end
		if flag29==true then
				if llbranch==8 or llbranch==24 then
				  if selx==rootx-8 and sely==rooty-8 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
				      llbranch=1
				      flag29=false
						  end
				  end
				end
		end
		if flag30==true then
				if lrbranch==10 or lrbranch==26 then
				  if selx==rootx+8 and sely==rooty-8 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
				      lrbranch=1
				      flag30=false
						  end
				  end
				end
		end
end

--age 20
if treeage>=20 then
  if flag25==true then
				if topcenter2==40 or topcenter2==42 then
				  if selx==rootx and sely==rooty-24 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
						    topcenter2=1
						    flag25=false
						  end
				  end
				end
		end
		if flag26==true then
				if tlbranch==8 or tlbranch==24 then
				  if selx==rootx-8 and sely==rooty-16 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
				      tlbranch=1
				      flag26=false
						  end
				  end
				end
		end
		if flag27==true then
				if trbranch==10 or trbranch==26 then
				  if selx==rootx+8 and sely==rooty-16 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
				      trbranch=1
				      flag27=false
						  end
				  end
				end
		end
end

--age 25
if treeage>=25 then
		if flag31==true then
				if trunk_spr==25 then
				  if selx==rootx and sely==rooty-8 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
						    trunk_spr=9
						    flag31=false
						  end
				  end
				end
		end
end

--age 30
if treeage>=30 then
  if flag22==true then
				if topcenter3==40 or topcenter3==42 then
				  if selx==rootx and sely==rooty-32 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
						    topcenter3=1
						    flag22=false
						  end
				  end
				end
		end
		if flag23==true then
				if ulbranch==8 or ulbranch==24 then
				  if selx==rootx-8 and sely==rooty-24 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
				      ulbranch=1
				      flag23=false
						  end
				  end
				end
		end
		if flag24==true then
				if urbranch==10 or urbranch==26 then
				  if selx==rootx+8 and sely==rooty-24 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
				      urbranch=1
				      flag24=false
						  end
				  end
				end
		end
end

--age 35
if treeage>=35 then
		if flag32==true then
				if topcenter==25 then
				  if selx==rootx and sely==rooty-16 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
						    topcenter=9
						    flag32=false
						  end
				  end
				end
		end
end

--age 40
if treeage>=40 then
		if flag33==true then
				if topcenter2==25 then
				  if selx==rootx and sely==rooty-24 then
				    trimtext()
				    if btnp(5) then
				      sfx(3)
						    topcenter2=9
						    flag33=false
						  end
				  end
				end
		end
end

--flowers
--[[if selx==56 and sely==24 then
  if fflag==false then
    if btnp(5) then
      fflag=true
      ftool=49
    end
  elseif fflag==true then
    if btnp(5) then
      fflag=false
      ftool=50
    end
  end
end

if fflag==true then
  if topcenter3==12 then
    topcenter3=30
  end
  if ulbranch==11 then
    ulbranch=14
  end
  if urbranch==13 then
    urbranch=15
  end
  if topcenter2==12 then
    topcenter2=30
  end
  if tlbranch==11 then
    tlbranch=14
  end
  if trbranch==13 then
    trbranch=15
  end
  if topcenter==12 then
    topcenter=30
  end
  if llbranch==11 then
    llbranch=14
  end
  if lrbranch==13 then
    lrbranch=15
  end
  if trunk_spr==12 then
    trunk_spr=30
  end
elseif fflag==false then
  if topcenter3==30 then
    topcenter3=12
  end
  if ulbranch==14 then
    ulbranch=11
  end
  if urbranch==15 then
    urbranch=13
  end
  if topcenter2==30 then
    topcenter2=12
  end
  if tlbranch==14 then
    tlbranch=11
  end
  if trbranch==15 then
    trbranch=13
  end
  if topcetner==30 then
    topcenter=12
  end
  if llbranch==14 then
    llbranch=11
  end
  if lrbranch==15 then
    lrbranch=13
  end
  if trunk_spr==30 then
    trunk_spr=12
  end
end
]]
		
--tree growth-------
if treeage>=0 then
  flag0=false
end

--day 2
if treeage>=2 then
  spr(root_spr,rootx,rooty)
  --trim
  if flag1==true then
		  if selx==rootx and sely==rooty then
		    trimtext()
		    if btnp(5) then
		      sfx(3)
		      if root_spr==7 then 
		        root_spr=23
		      elseif root_spr==23 then 
		        root_spr=6
		      else 
		        root_spr=4
		        flag0=true
		      end
		    end
		  end
  end
end

--day 5
if treeage>=5 then
  spr(42,rootx,rooty-8)
end

--day 10
if treeage>=10 then
  spr(9,rootx,rooty-8)
  if flag29==true then
    spr(llbranch,rootx-8,rooty-8)
  end
  if flag30==true then
    spr(lrbranch,rootx+8,rooty-8)
  end
  spr(topcenter,rootx,rooty-16)
end
  
--day 15 
if treeage>=15 then
  spr(topcenter,rootx,rooty-16)
  if llbranch==8 then llbranch=11 end
  if lrbranch==10 then lrbranch=13 end
  spr(trunk_spr,rootx,rooty-8)
  if topcenter==40 then topcenter=12 end
  --trim
  if flag2==true then
		  if selx==rootx and sely==(rooty-8) then
		    trimtext()
		    if btnp(5) then
		      sfx(3)
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
		      sfx(3)
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
		      sfx(3)
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
		      sfx(3)
		      if lrbranch==13 then
		        lrbranch=26
		        flag5=false
		      end
		    end
		  end
  end            
end

--day 20
if treeage>=20 then
  if flag3==false then
		  topcenter=9
				spr(tlbranch,rootx-8,rooty-16)
				spr(trbranch,rootx+8,rooty-16)
				spr(topcenter2,rootx,rooty-24)
		end 
end

--day 25
if treeage>=25 then
		if flag6==true then
		  if topcenter2==40 then
		    topcenter2=12
		  end
		  if selx==rootx and sely==rooty-24 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if topcenter2==12 then
				      topcenter2=42
				      flag6=false
				    end
				  end
		  end
		end
		if flag7==true then
		  if tlbranch==8 then
		    tlbranch=11
		  end
		  if selx==rootx-8 and sely==rooty-16 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if tlbranch==11 then
				      tlbranch=8
				      flag7=false
				    end
				  end
		  end
		end
		if flag8==true then
		  if trbranch==10 then
		    trbranch=13
		  end
		  if selx==rootx+8 and sely==rooty-16 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if trbranch==13 then
				      trbranch=10
				      flag8=false
				    end
				  end
		  end
		end
		if flag9==true then
		  if topcenter==9 then
      topcenter=12
    end
		  if selx==rootx and sely==rooty-16 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if topcenter==12 then
				      topcenter=9
				      flag9=false
				    end
				  end
		  end
		end
		if flag10==true then
		  if llbranch==24 then
      llbranch=11
    end
		  if selx==rootx-8 and sely==rooty-8 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if llbranch==11 then
				      llbranch=24
				      flag10=false
				    end
				  end
		  end
		end
		if flag11==true then
		  if lrbranch==26 then
      lrbranch=13
    end
		  if selx==rootx+8 and sely==rooty-8 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if lrbranch==13 then
				      lrbranch=26
				      flag11=false
				    end
				  end
		  end
		end
		if flag12==true then
		  if trunk_spr==9 then
      trunk_spr=12
    end
		  if selx==rootx and sely==rooty-8 then
		    trimtext()
		    if btn(5) then
		      sfx(3)
		      if trunk_spr==12 then
				      trunk_spr=25
				      flag12=false
				    end
				  end
		  end
		end
end

--day 30
if treeage>=30 then
  if flag6==false then
				if topcenter2==42 then
				  topcenter2=9
				end
				if tlbranch==8 then
				  tlbranch=24
				end
				if trbranch==10 then
				  trbranch=26
				end
				spr(topcenter3,rootx,rooty-32)
				spr(ulbranch,rootx-8,rooty-24)
				spr(urbranch,rootx+8,rooty-24)
  end
end

--day 35
if treeage>=35 then
  if flag6==false then
				if flag13==true then
				  if topcenter3==40 then
				    topcenter3=12
				  end
				  if selx==rootx and sely==rooty-32 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if topcenter3==12 then
						      topcenter3=40
						      flag13=false
						    end
						  end
				  end
				end
				if flag14==true then
				  if ulbranch==8 then
				    ulbranch=11
				  end
				  if selx==rootx-8 and sely==rooty-24 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if ulbranch==11 then
						      ulbranch=8
						      flag14=false
						    end
						  end
				  end
				end
				if flag15==true then
				  if urbranch==10 then
				    urbranch=13
				  end
				  if selx==rootx+8 and sely==rooty-24 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if urbranch==13 then
						      urbranch=10
						      flag15=false
						    end
						  end
				  end
				end
				if flag16==true and flag32==true then
				  if topcenter2==9 then
				    topcenter2=12
				  end
				  if selx==rootx and sely==rooty-24 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if topcenter2==12 then
						      topcenter2=9
						      flag16=false
						    end
						  end
				  end
				end
				if flag17==true then
				  if tlbranch==24 then
				    tlbranch=11
				  end
				  if selx==rootx-8 and sely==rooty-16 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if tlbranch==11 then
						      tlbranch=24
						      flag17=false
						    end
						  end
				  end
				end
				if flag18==true then
				  if trbranch==26 then
				    trbranch=13
				  end
				  if selx==rootx+8 and sely==rooty-16 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if trbranch==13 then
						      trbranch=26
						      flag18=false
						    end
						  end
				  end
				end
				if flag32==true then
						if topcenter==9 then
						  topcenter=25
						end
				end
				if flag19==true then
				  if llbranch==24 then
				    llbranch=11
				  end
				  if selx==rootx-8 and sely==rooty-8 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if llbranch==11 then
						      llbranch=24
						      flag19=false
						    end
						  end
				  end
				end
				if flag20==true then
				  if lrbranch==26 then
				    lrbranch=13
				  end
				  if selx==rootx+8 and sely==rooty-8 then
				    trimtext()
				    if btn(5) then
				      sfx(3)
				      if lrbranch==13 then
						      lrbranch=26
						      flag20=false
						    end
						  end
				  end
				end
		end
end

--day 40
if treeage>=40 then
  if flag13==false and flag33==true then
		  if topcenter2==9 then
		    topcenter2=25
		  end
		end
	 if flag14==false then
		  if ulbranch==8 then
		    ulbranch=24
		  end
		end
		if flag15==false then
		  if urbranch==10 then
		    urbranch=26
		  end
		end	
end

--day 45
if treeage>=45 then
		if topcenter3==40 then topcenter3=12 end
		if topcenter2==25 then topcenter2=12 end
		if topcenter==25 then topcenter=12 end
		if ulbranch==24 then ulbranch=11 end
		if urbranch==26 then urbranch=13 end
		if tlbranch==24 then tlbranch=11 end
		if trbranch==26 then trbranch=13 end
		if llbranch==24 then llbranch=11 end
		if lrbranch==26 then lrbranch=13 end
		if trunk_spr==25 then trunk_spr=12 end
end

----------------
--cursor
if sflag==false then
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
		if selx>=56 and sely>56 then
		 sely=56
		 end
end

--debug
--print(sec, 0, 0, 0)
--print(nsec, 0, 8, 0)

if day==0 and hour==2 then
  music(0)
end

if btnp(4) then
  if mflag==true then
    music(-1)
    mflag=false
  elseif mflag==false then
    music(0)
    mflag=true
  end
end

--eof
end
_draw()
-->8
--update
function _update()

-- clock		
		nsec=stat(95)
		if nsec==0 then sec=0 end
		if hour==25 then hour=1 end
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
		
		if hour==25 and flag0==false then 
		  treeage=treeage+1
		  end
		  
		if treeage>99 then treeage=99 end  
		  
		if flag0==true then
		  init()
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
00000000ffffffff44444444fffffffffffffffffffffffffff44fff34344ffffffffffffff44ffffffffffff333333ff333333ff333333ff33e333ff333333f
00000000ffffffff44444444fffffffffffffffffffffffffff44ffff3444343fffff33ffff44fffffffffff33333333333333333333333333eae33333e33333
00000000ffffffff44444444fffffffffffffffffffffffffff44ffffff4443ffff33343fff44fffffffffff333333333333333333333333333e33333eae3333
00000000ffffffff44444444fffffffffffffffffffffffffff44ffffff44fffff33333344444fffffffffff3333333433333333333333333e33333433e333e3
00000000ffffffff444444442222222222222222222222222222222222222222fff3333fff444ffff33fffff333344333333333333343333eae3443333343eae
00000000ffffffff444444442222222222222222222222222222222222222222fffffffffff44fff34333fff3333333333333333344333333e33e3333443e3e3
00000000ffffffff44444444f2222222222222222222222f2222222222222222fffffffffff44444333333ff333333333333333333333333333eae33333eae33
00000000ffffffff44444444fff222ffffffffffff222ffffffffffffffffffffffffffffff444fff3333ffff333333ff334433ff333333ff333e33ff333e33f
cccccccc777777777777777577777775ffffffff00000000fff44ffff4f44ffffffffffffff44ffffffffffff333333ff334433ff333333ff333333f00000000
cccccccc766666677555555d7555555dffffffff00000000fff44fffff444f4ffff333fffff44fffffffffff3333333333333333333333333333333300000000
cccccccc76666667755c555d7558585dffffffff00000000fff44ffffff444ffff33333ffff44fffffffffff33333333333333333333333333333e3300000000
cccccccc76666667755cc55d7555755dffffffff00000000fff44ffffff44ffff333344344444fffff333fff3333333333333333333333333333eae300000000
cccccccc7666666775cccc5d7557575dffffffff00000000fff44fff22222222f3333343ff444ffff33333ff33334443333333333444333333e33e3300000000
cccccccc76666667755cc55d7557575dffffffff00000000fff44fff22222222ff33333fff3333443443333f3333334444333344443333333eae333300000000
cccccccc766666677555555d7555555dffffffff00000000fff44fff22222222ffff33fff333333f3433333f33333333334444333333333333e3333300000000
cccccccc777777775ddddddd5dddddddffffffff00000000fff44fffffffffffffffffffff3333fff33333fff333333ff334433ff333333ff334433f00000000
eeeeeeee7777777777777775ffffffffffffffffffffffff00000000fffffffffffffffffff44fff343ff343fffffffff44ff44fffffffff0000000000000000
eeeeeeee777777777555555dffaaaafffffff33fffffffff00000000fffffffffffffffffff44ffff344443fffffffffff4444ffffffffff0000000000000000
eeeeeeee777777777535355dfaaaaaaffff3e343ffffffff00000000ffffffffffffffff33344ffffff44ffffffffffffff44fffffffffff0000000000000000
eeeeeeee777777777553535dfaaaaaafff3eae33ffffffff00000000ffffffffffffffff34344ffffff44ffffffffffffff44fffffffffff0000000000000000
eeeeeeee777777777535355dfaaaaaaffff3e33ff33fffff00000000fff33efffff333ff33444fff33344333ffff444ffff44fffff444fff0000000000000000
eeeeeeee777777777553535dfaaaaaafffffffff343e3fff00000000ffe3eaefff33333ffff4433344344344ffffff4444444444444fffff0000000000000000
eeeeeeee777777777555555dffaaaaffffffffff33eae3ff00000000feae4e3ff333433ffff4434333444433ffffffffff4444ffffffffff0000000000000000
eeeeeeee777777775dddddddfffffffffffffffff33e3fff00000000ffe433ffff3433fffff44433fff44ffffffffffffff44fffffffffff0000000000000000
999999995555555777777775ffffffffffffffffffffffffcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
999999995777777d7555555dffaaaafffffe33ffffffffffcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
99999999577ee77d755ee55df555aaafffeae33fffffffffcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
9999999957eaae7d75eaae5df5555aaff33e3443ff3e3fffcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
99999999577ee77d755ee55df5555aaff3333e43f3eae3ffcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0000000000000000
999999995777377d7555355df555aaafff33eaef344e3e3fcccccccccccccccccccccccccccccccccccccaaaaaaacccccccccccccccccccc0000000000000000
999999995773737d7553535dffaaaaffffff3eff3433eaefccccccccccccccccccccccccccccccccccccaaeeeeeacccccccccccccccccccc0000000000000000
999999997ddddddd5dddddddfffffffffffffffff3333effccccccccccccccccccccccccceeeecccccccaeeaaaeaaccccccccccccccccccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccccccccccccccceaaeeccccccaeaaaaaeaccccccccccccccccccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccccccccccccccceeaaeccccccaeaaaaaeaccccccccccccccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccceeeeccaaaaaeaaaaaeaccccccceeeecccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccaaaaaaaaacccccccccaaeeeeeaaaaaeaaaccccceaaeeccccccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccaaeeeeeeeaacccaaaaaaeaaaaeaaaaaeeeaaccceeaaaeecccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccaaeeaaaaaeeaacaaeeeeeeaaaaaaaaaaaaeeaaaceaaaaaecccccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccaaeeaaaaaaaeeacaeeaaaeeaaaaaaaaaaaaaaeeaceeaaaaecccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccaaeeaaaeeaaaaeacaeaaaaaeeaaaaaaaaaaaaaaeacceaaaeecccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccaeeaaaeeeaaaeeaaaeaaaaaaeaaaeaaaaaaaaaaeacceeeeeccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccaeaaaaeeeaaaeeeeeeeaaaaaeeeeeaaaaeeeeeeeacccccccccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccaeeaaaaaaaaeeaaaaaeeaaaaeaaaeaaaaeaaaaaaacccccccccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccaaeeaaaaaaeeaaaaaaaeeaaaeacaeaaaaeaccccccccaaaaaaaccccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccaaeaaaaaaaaaaaaaaaaeaaaeacaeaaaaeacccccccaaeeeeeaacccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccaaeeaaaaaaaaaeeaaaaeeaaeacaeaaaaeacccccccaeeaaaeeaaccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccaaeaaaaaaaaeeeaaaaaeaaeacaeeaaeeacccccccaeaaaaaeeaacc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccaeeaaaaaaaeeeaaaaeeeeaacaaeeeeaacccccccaeaaaaaaeeacc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccaaeaaaaaaaaaaaaaaeaaaacccaaaaaaccccccccaeaaaaaaaeacc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccaaeaaaaaaaaaaaeeeacccccaaaaaaccccccccaaeaaaaaaaeaac0000000000000000
000000000000000000000000000000000000000000000000ccaaaaaaaaacccaeeaaaaaaaaeeeaaaccaaaaeeeeaaacaaaaaaeeeeaaaaaeeac0000000000000000
000000000000000000000000000000000000000000000000caaeeeeeeeaaccaaeeeeeeeeeeaaaccccaeeeeaaeeeaaaeeeeeeaaeeaaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aaeeaaaaaeeaaccaaaaaaaaaaaacccccaaeaaaaaaaeeaeeaaaeeaaaeaaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeeaaaaaaaaeaacccccccccccccaaaaaaeeaaaaaaaaeeeaaaaaeaaaeeaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaaaaaaeeaaccccccccccaaaeeeeeeaaaaaaaaaaeaaaaaaaaaaaeaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaaaaaaaeeaccccccaaaaaeeeaaaaeeaaaaaaaaaeaaaaaaaaaaaeaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaeeeaaaaeacccccaaeeeeeaaaaaaaeeaaaaaaaaeaaeeeaaaaaaeaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaeaeaaaaeacccccaeeaaeeaaaaaaaaeeaaaaaaeeaaeeeaaaaaaeaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaeeeaaaaeacccccaeaaaeeaaaaaaaaaeeaeeeeeeaaaeeaaaaaaeaaaaeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaaaaaaaaeacccccaeaaaaeaaaaaaaaaaeaaaaaaeeaaaaaaaaaaeaaaeeac0000000000000000
000000000000000000000000000000000000000000000000aeaaaaaaaaaaeeacaaaaaeaaaaaaaaaaaaaaaeaaaaaaaeeaaaaaeaaeeeeeeaac0000000000000000
000000000000000000000000000000000000000000000000aeeaaaaaaaaeeaaaaeeeeeeaaaaaaaaeaaaaaeaaaaaaaaeaaaaaeeeeaaaaaacc0000000000000000
000000000000000000000000000000000000000000000000aaeaaaaaaaaeeeeeeeaaaaeeaaaaaaeeaaaaaeeeeeaaaaeeaaaeeaaaaccccccc0000000000000000
000000000000000000000000000000000000000000000000caeaaaaaaaaaaaaeeaaaaaaeeaaaeeeeaaaaaeeaaeeaaaaeeeeeaacccccccccc0000000000000000
000000000000000000000000000000000000000000000000caeeaaaaaaaaaaaaeeaaaaaaeeaaeeaeaaaaaaeaaaaaaaaeaaaaaccbbbbccccc0000000000000000
000000000000000000000000000000000000000000000000caaeaaaaaaaaaaaaaeeaaaaaaeaaaeaeeaaaaeeaaaaaaaeeacccccbb33bbcccc0000000000000000
000000000000000000000000000000000000000000000000ccaeaaaaaaaaaaaaaaeeeeaaaeaaaeaaeaaaaeaaaaaaaaeaacccbbb3333bbccc0000000000000000
000000000000000000000000000000000000000000000000ccaeaaaaaaeeeeaaaaaeaeaaaeeaaeaaeeaaeeaaaaaaaaeacccbb3334333bccc0000000000000000
000000000000000000000000000000000000000000000000ccaeaaaaaaeaaeaaaaaeeeaaaaeaaeaaaeeeeaaaaaaaaeeaccbb33334333bccc0000000000000000
000000000000000000000000000000000000000000000000ccaaeaaaaaeaaeaaaaaeaaaaaaeaaeacaaaaeeaaaaaeeeaaccb33333333bbccc0000000000000000
000000000000000000000000000000000000000000000000cccaeaaaaaeeeeaaaaaeaaaaaeeeeaaccccaaeeeeeeeaaacccb3334333bbcccc0000000000000000
000000000000000000000000000000000000000000000000cccaeaaaaaaaaaaaaaaeaaaaeeaaaaccccccaaaaaaaaacccccbb33433bbccccc0000000000000000
000000000000000000000000000000000000000000000000cccaeaaaaaaaaaaaaeeeaaaeaaaccccccccccccccccccccccccb3443bbcccccc0000000000000000
000000000000000000000000000000000000000000000000cccaeeaaaaaaaaaaeaaaaeeaacccccccccccccccbbbbbbbccccbb4bbbccccccc0000000000000000
000000000000000000000000000000000000000000000000cccaaeeaaaaaaeeeeeeeeaaacccccccccccccbbbb33333bbbccb44bbbbbbbbbc0000000000000000
000000000000000000000000000000000000000000000000ccccaaeeeeeeeeaaaaaaaacccccccccccccccb3333333333bcbb44bb333333bb0000000000000000
000000000000000000000000000000000000000000000000cccccaaaaaaaaaaccccccccccccccccccccccb3334433333bbb444434433333b0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccb33333334434b4444333333333b0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccbbbb33333344444bb333334433b0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccccccccccccccccbbbb333b444bbbb333333bbb0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccccccbbbbb444bccbbbbbbbbcc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccccccccccb444bcccccccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccccccccccb444bcccccccccccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccbbbbbbbbb444bbbbbbbbbcccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccb2222222222222222222bcccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccb2222222222222222222bcccc0000000000000000
000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccbb22222222222222222bbcccc0000000000000000
000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccccccccccccccccbbb222bbbbbbb222bbbccccc0000000000000000
__label__
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777cc777777ee777777aa777777cc777777cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777cc777777ee777777aa777777cc777777cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeecccccccc77cccc77ee77aaaa77eeaa777777cccccc77cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeecccccccc77cccc77ee77aaaa77eeaa777777cccccc77cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccceeaaaaeeeecccccc77cccc7777aaaaaa77aaee77cc77cccc7777cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccceeaaaaeeeecccccc77cccc7777aaaaaa77aaee77cc77cccc7777cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccceeeeaaaaeecccccc77cccc77ee77aaaa77aaee77cc77cccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccceeeeaaaaeecccccc77cccc77ee77aaaa77aaee77cc77cccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeccccaa77aaaa77ee77aa777777ee77cc77cccc77cccceeeeeeeecccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeccccaa77aaaa77ee77aa777777ee77cc77cccc77cccceeeeeeeecccccccccccccccc
ccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaccccccccccccccccccaaaaeeeeeeeeeeaaaaaaaaaaeeaaaaaacccccccccceeaaaaeeeecccccccccccccc
ccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaccccccccccccccccccaaaaeeeeeeeeeeaaaaaaaaaaeeaaaaaacccccccccceeaaaaeeeecccccccccccccc
ccccccccccccccccccccccccaaaaeeeeeeeeeeeeeeaaaaccccccaaaaaaaaaaaaeeaaaaaaaaeeaaaaaaaaaaeeeeeeaaaacccccceeeeaaaaaaeeeecccccccccccc
ccccccccccccccccccccccccaaaaeeeeeeeeeeeeeeaaaaccccccaaaaaaaaaaaaeeaaaaaaaaeeaaaaaaaaaaeeeeeeaaaacccccceeeeaaaaaaeeeecccccccccccc
ccccccccccccccccccccccaaaaeeeeaaaaaaaaaaeeeeaaaaccaaaaeeeeeeeeeeeeaaaaaaaaaaaaaaaaaaaaaaaaeeeeaaaaaacceeaaaaaaaaaaeecccccccccccc
ccccccccccccccccccccccaaaaeeeeaaaaaaaaaaeeeeaaaaccaaaaeeeeeeeeeeeeaaaaaaaaaaaaaaaaaaaaaaaaeeeeaaaaaacceeaaaaaaaaaaeecccccccccccc
ccccccccccccccccccccaaaaeeeeaaaaaaaaaaaaaaeeeeaaccaaeeeeaaaaaaeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeeeaacceeeeaaaaaaaaeecccccccccccc
ccccccccccccccccccccaaaaeeeeaaaaaaaaaaaaaaeeeeaaccaaeeeeaaaaaaeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeeeaacceeeeaaaaaaaaeecccccccccccc
ccccccccccccccccccaaaaeeeeaaaaaaeeeeaaaaaaaaeeaaccaaeeaaaaaaaaaaeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeaacccceeaaaaaaeeeecccccccccccc
ccccccccccccccccccaaaaeeeeaaaaaaeeeeaaaaaaaaeeaaccaaeeaaaaaaaaaaeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeaacccceeaaaaaaeeeecccccccccccc
ccccccccccccccccccaaeeeeaaaaaaeeeeeeaaaaaaeeeeaaaaaaeeaaaaaaaaaaaaeeaaaaaaeeaaaaaaaaaaaaaaaaaaaaeeaacccceeeeeeeeeecccccccccccccc
ccccccccccccccccccaaeeeeaaaaaaeeeeeeaaaaaaeeeeaaaaaaeeaaaaaaaaaaaaeeaaaaaaeeaaaaaaaaaaaaaaaaaaaaeeaacccceeeeeeeeeecccccccccccccc
ccccccccccccccccccaaeeaaaaaaaaeeeeeeaaaaaaeeeeeeeeeeeeeeaaaaaaaaaaeeeeeeeeeeaaaaaaaaeeeeeeeeeeeeeeaacccccccccccccccccccccccccccc
ccccccccccccccccccaaeeaaaaaaaaeeeeeeaaaaaaeeeeeeeeeeeeeeaaaaaaaaaaeeeeeeeeeeaaaaaaaaeeeeeeeeeeeeeeaacccccccccccccccccccccccccccc
ccccccccccccccccccaaeeeeaaaaaaaaaaaaaaaaeeeeaaaaaaaaaaeeeeaaaaaaaaeeaaaaaaeeaaaaaaaaeeaaaaaaaaaaaaaacccccccccccccccccccccccccccc
ccccccccccccccccccaaeeeeaaaaaaaaaaaaaaaaeeeeaaaaaaaaaaeeeeaaaaaaaaeeaaaaaaeeaaaaaaaaeeaaaaaaaaaaaaaacccccccccccccccccccccccccccc
ccccccccccccccccccaaaaeeeeaaaaaaaaaaaaeeeeaaaaaaaaaaaaaaeeeeaaaaaaeeaaccaaeeaaaaaaaaeeaaccccccccccccccccaaaaaaaaaaaaaacccccccccc
ccccccccccccccccccaaaaeeeeaaaaaaaaaaaaeeeeaaaaaaaaaaaaaaeeeeaaaaaaeeaaccaaeeaaaaaaaaeeaaccccccccccccccccaaaaaaaaaaaaaacccccccccc
ccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaeeaaccaaeeaaaaaaaaeeaaccccccccccccccaaaaeeeeeeeeeeaaaacccccccc
ccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaeeaaccaaeeaaaaaaaaeeaaccccccccccccccaaaaeeeeeeeeeeaaaacccccccc
ccccccccccccccccccccaaaaeeeeaaaaaaaaaaaaaaaaaaeeeeaaaaaaaaeeeeaaaaeeaaccaaeeaaaaaaaaeeaaccccccccccccccaaeeeeaaaaaaeeeeaaaacccccc
ccccccccccccccccccccaaaaeeeeaaaaaaaaaaaaaaaaaaeeeeaaaaaaaaeeeeaaaaeeaaccaaeeaaaaaaaaeeaaccccccccccccccaaeeeeaaaaaaeeeeaaaacccccc
ccccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaeeeeeeaaaaaaaaaaeeaaaaeeaaccaaeeeeaaaaeeeeaaccccccccccccccaaeeaaaaaaaaaaeeeeaaaacccc
ccccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaeeeeeeaaaaaaaaaaeeaaaaeeaaccaaeeeeaaaaeeeeaaccccccccccccccaaeeaaaaaaaaaaeeeeaaaacccc
ccccccccccccccccccccccccaaeeeeaaaaaaaaaaaaaaeeeeeeaaaaaaaaeeeeeeeeaaaaccaaaaeeeeeeeeaaaaccccccccccccccaaeeaaaaaaaaaaaaeeeeaacccc
ccccccccccccccccccccccccaaeeeeaaaaaaaaaaaaaaeeeeeeaaaaaaaaeeeeeeeeaaaaccaaaaeeeeeeeeaaaaccccccccccccccaaeeaaaaaaaaaaaaeeeeaacccc
ccccccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaccccccaaaaaaaaaaaaccccccccccccccccaaeeaaaaaaaaaaaaaaeeaacccc
ccccccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaccccccaaaaaaaaaaaaccccccccccccccccaaeeaaaaaaaaaaaaaaeeaacccc
ccccccccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaaaaaaaeeeeeeaaccccccccccaaaaaaaaaaaaccccccccccccccccaaaaeeaaaaaaaaaaaaaaeeaaaacc
ccccccccccccccccccccccccccaaaaeeaaaaaaaaaaaaaaaaaaaaaaeeeeeeaaccccccccccaaaaaaaaaaaaccccccccccccccccaaaaeeaaaaaaaaaaaaaaeeaaaacc
ccccaaaaaaaaaaaaaaaaaaccccccaaeeeeaaaaaaaaaaaaaaaaeeeeeeaaaaaaccccaaaaaaaaeeeeeeeeaaaaaaccaaaaaaaaaaaaeeeeeeeeaaaaaaaaaaeeeeaacc
ccccaaaaaaaaaaaaaaaaaaccccccaaeeeeaaaaaaaaaaaaaaaaeeeeeeaaaaaaccccaaaaaaaaeeeeeeeeaaaaaaccaaaaaaaaaaaaeeeeeeeeaaaaaaaaaaeeeeaacc
ccaaaaeeeeeeeeeeeeeeaaaaccccaaaaeeeeeeeeeeeeeeeeeeeeaaaaaaccccccccaaeeeeeeeeaaaaeeeeeeaaaaaaeeeeeeeeeeeeaaaaeeeeaaaaaaaaaaeeaacc
ccaaaaeeeeeeeeeeeeeeaaaaccccaaaaeeeeeeeeeeeeeeeeeeeeaaaaaaccccccccaaeeeeeeeeaaaaeeeeeeaaaaaaeeeeeeeeeeeeaaaaeeeeaaaaaaaaaaeeaacc
aaaaeeeeaaaaaaaaaaeeeeaaaaccccaaaaaaaaaaaaaaaaaaaaaaaaccccccccccaaaaeeaaaaaaaaaaaaaaeeeeaaeeeeaaaaaaeeeeaaaaaaeeaaaaaaaaaaeeaacc
aaaaeeeeaaaaaaaaaaeeeeaaaaccccaaaaaaaaaaaaaaaaaaaaaaaaccccccccccaaaaeeaaaaaaaaaaaaaaeeeeaaeeeeaaaaaaeeeeaaaaaaeeaaaaaaaaaaeeaacc
aaeeeeaaaaaaaaaaaaaaaaeeaaaaccccccccccccccccccccccccccaaaaaaaaaaaaeeeeaaaaaaaaaaaaaaaaeeeeeeaaaaaaaaaaeeaaaaaaeeeeaaaaaaaaeeaacc
aaeeeeaaaaaaaaaaaaaaaaeeaaaaccccccccccccccccccccccccccaaaaaaaaaaaaeeeeaaaaaaaaaaaaaaaaeeeeeeaaaaaaaaaaeeaaaaaaeeeeaaaaaaaaeeaacc
aaeeaaaaaaaaaaaaaaaaaaeeeeaaaaccccccccccccccccccccaaaaaaeeeeeeeeeeeeaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaaaaaaaaaaaeeeeaaaaccccccccccccccccccccaaaaaaeeeeeeeeeeeeaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaaaaaaaaaaaaaeeeeaaccccccccccccaaaaaaaaaaeeeeeeaaaaaaaaeeeeaaaaaaaaaaaaaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaaaaaaaaaaaaaeeeeaaccccccccccccaaaaaaaaaaeeeeeeaaaaaaaaeeeeaaaaaaaaaaaaaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaeeeeeeaaaaaaaaeeaaccccccccccaaaaeeeeff333333333333ffaaaaeeeeaaaaaaaaaaaaaaaaeeaaaaeeeeeeaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaeeeeeeaaaaaaaaeeaaccccccccccaaaaeeeeff333333333333ffaaaaeeeeaaaaaaaaaaaaaaaaeeaaaaeeeeeeaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaeeaaeeaaaaaaaaeeaaccccccccccaaeeeeaa3333333333333333aaaaaaeeeeaaaaaaaaaaaaeeeeaaaaeeeeeeaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaeeaaeeaaaaaaaaeeaaccccccccccaaeeeeaa3333333333333333aaaaaaeeeeaaaaaaaaaaaaeeeeaaaaeeeeeeaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaeeeeeeaaaaaaaaeeaaccccccccccaaeeaaaa3333333333333333aaaaaaaaeeeeaaeeeeeeeeeeeeaaaaaaeeeeaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaeeeeeeaaaaaaaaeeaaccccccccccaaeeaaaa3333333333333333aaaaaaaaeeeeaaeeeeeeeeeeeeaaaaaaeeeeaaaaaaaaaaaaeeaaaaaaaaeeaacc
aaeeaaaaaaaaaaaaaaaaaaaaaaeeaaccccccccccaaeeaaaa3333333333333333aaaaaaaaaaeeaaaaaaaaaaaaeeeeaaaaaaaaaaaaaaaaaaaaeeaaaaaaeeeeaacc
aaeeaaaaaaaaaaaaaaaaaaaaaaeeaaccccccccccaaeeaaaa3333333333333333aaaaaaaaaaeeaaaaaaaaaaaaeeeeaaaaaaaaaaaaaaaaaaaaeeaaaaaaeeeeaacc
aaeeaaaaaaaaaaaaaaaaaaaaeeeeaaccaaaaaaaaaaeeaaaa3333333333333333aaaaaaaaaaeeaaaaaaaaaaaaaaeeeeaaaaaaaaaaeeaaaaeeeeeeeeeeeeaaaacc
aaeeaaaaaaaaaaaaaaaaaaaaeeeeaaccaaaaaaaaaaeeaaaa3333333333333333aaaaaaaaaaeeaaaaaaaaaaaaaaeeeeaaaaaaaaaaeeaaaaeeeeeeeeeeeeaaaacc
aaeeeeaaaaaaaaaaaaaaaaeeeeaaaaaaaaeeeeeeeeeeeeaa3333333333333333aaaaaaaaaaeeaaaaaaaaaaaaaaaaeeaaaaaaaaaaeeeeeeeeaaaaaaaaaaaacccc
aaeeeeaaaaaaaaaaaaaaaaeeeeaaaaaaaaeeeeeeeeeeeeaa3333333333333333aaaaaaaaaaeeaaaaaaaaaaaaaaaaeeaaaaaaaaaaeeeeeeeeaaaaaaaaaaaacccc
aaaaeeaaaaaaaaaaaaaaaaeeeeeeeeeeeeeeaaaaaaaaeeee3333333333333333aaaaaaaaaaeeeeeeeeeeaaaaaaaaeeeeaaaaaaeeeeaaaaaaaacccccccccccccc
aaaaeeaaaaaaaaaaaaaaaaeeeeeeeeeeeeeeaaaaaaaaeeee3333333333333333aaaaaaaaaaeeeeeeeeeeaaaaaaaaeeeeaaaaaaeeeeaaaaaaaacccccccccccccc
ccaaeeaaaaaaaaaaaaaaaaaaaaaaaaeeeeaaaaaaaaaaaaeeff333344443333ffaaaaaaaaaaeeeeaaaaeeeeaaaaaaaaeeeeeeeeeeaaaacccccccccccccccccccc
ccaaeeaaaaaaaaaaaaaaaaaaaaaaaaeeeeaaaaaaaaaaaaeeff333344443333ffaaaaaaaaaaeeeeaaaaeeeeaaaaaaaaeeeeeeeeeeaaaacccccccccccccccccccc
ccaaeeeeaaaaaaaaaaaaaaaaaaaaaaaaff333333333333ffff333333333333ffff333333333333ffaaaaaaaaaaaaaaeeaaaaaaaaaaccccbbbbbbbbcccccccccc
ccaaeeeeaaaaaaaaaaaaaaaaaaaaaaaaff333333333333ffff333333333333ffff333333333333ffaaaaaaaaaaaaaaeeaaaaaaaaaaccccbbbbbbbbcccccccccc
ccaaaaeeaaaaaaaaaaaaaaaaaaaaaaaa333333333333333333333333333333333333333333333333aaaaaaaaaaaaeeeeaaccccccccccbbbb3333bbbbcccccccc
ccaaaaeeaaaaaaaaaaaaaaaaaaaaaaaa333333333333333333333333333333333333333333333333aaaaaaaaaaaaeeeeaaccccccccccbbbb3333bbbbcccccccc
ccccaaeeaaaaaaaaaaaaaaaaaaaaaaaa333333333333333333333333333333333333333333333333aaaaaaaaaaaaeeaaaaccccccbbbbbb33333333bbbbcccccc
ccccaaeeaaaaaaaaaaaaaaaaaaaaaaaa333333333333333333333333333333333333333333333333aaaaaaaaaaaaeeaaaaccccccbbbbbb33333333bbbbcccccc
ccccaaeeaaaaaaaaaaaaeeeeeeeeaaaa333333333333334433333333333333333333333333333333aaaaaaaaaaaaeeaaccccccbbbb33333344333333bbcccccc
ccccaaeeaaaaaaaaaaaaeeeeeeeeaaaa333333333333334433333333333333333333333333333333aaaaaaaaaaaaeeaaccccccbbbb33333344333333bbcccccc
ccccaaeeaaaaaaaaaaaaeeaaaaeeaaaa333333334444333333333333333333333333334433333333aaaaaaaaaaeeeeaaccccbbbb3333333344333333bbcccccc
ccccaaeeaaaaaaaaaaaaeeaaaaeeaaaa333333334444333333333333333333333333334433333333aaaaaaaaaaeeeeaaccccbbbb3333333344333333bbcccccc
ccccaaaaeeaaaaaaaaaaeeaaaaeeaaaa333333333333333333333333333333333344443333333333aaaaaaeeeeeeaaaaccccbb3333333333333333bbbbcccccc
ccccaaaaeeaaaaaaaaaaeeaaaaeeaaaa333333333333333333333333333333333344443333333333aaaaaaeeeeeeaaaaccccbb3333333333333333bbbbcccccc
ccccccaaeeaaaaaaaaaaeeeeeeeeaaaa333333333333333333333333333333333333333333333333eeeeeeeeaaaaaaccccccbb33333344333333bbbbcccccccc
ccccccaaeeaaaaaaaaaaeeeeeeeeaaaa333333333333333333333333333333333333333333333333eeeeeeeeaaaaaaccccccbb33333344333333bbbbcccccccc
ccccccaaeeaaaaaaaaaaaaaaaaaaaaaaff333333333333ffff333344443333ffff333333333333ffaaaaaaaaaaccccccccccbbbb3333443333bbbbcccccccccc
ccccccaaeeaaaaaaaaaaaaaaaaaaaaaaff333333333333ffff333344443333ffff333333333333ffaaaaaaaaaaccccccccccbbbb3333443333bbbbcccccccccc
ccccccaaeeaaaaaaaaaaaaaaaaaaaaaaaaeeeeeeaaaaaaee3344334444ffffffccccccccccccccccccccccccccccccccccccccbb33444433bbbbcccccccccccc
ccccccaaeeaaaaaaaaaaaaaaaaaaaaaaaaeeeeeeaaaaaaee3344334444ffffffccccccccccccccccccccccccccccccccccccccbb33444433bbbbcccccccccccc
ccccccaaeeeeaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaeeeeaaff33444444334433ccccccccccccccccbbbbbbbbbbbbbbccccccccbbbb44bbbbbbcccccccccccccc
ccccccaaeeeeaaaaaaaaaaaaaaaaaaaaeeaaaaaaaaeeeeaaff33444444334433ccccccccccccccccbbbbbbbbbbbbbbccccccccbbbb44bbbbbbcccccccccccccc
ccccccaaaaeeeeaaaaaaaaaaaaeeeeeeeeeeeeeeeeaaaaaaffffff44444433ffccccccccccbbbbbbbb3333333333bbbbbbccccbb4444bbbbbbbbbbbbbbbbbbcc
ccccccaaaaeeeeaaaaaaaaaaaaeeeeeeeeeeeeeeeeaaaaaaffffff44444433ffccccccccccbbbbbbbb3333333333bbbbbbccccbb4444bbbbbbbbbbbbbbbbbbcc
ccccccccaaaaeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaaccccffffff4444ffffffccccccccccbb33333333333333333333bbccbbbb4444bbbb333333333333bbbb
ccccccccaaaaeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaaccccffffff4444ffffffccccccccccbb33333333333333333333bbccbbbb4444bbbb333333333333bbbb
ccccccccccaaaaaaaaaaaaaaaaaaaacccccccccccccccccc2222222222222222ccccccccccbb33333344443333333333bbbbbb444444443344443333333333bb
ccccccccccaaaaaaaaaaaaaaaaaaaacccccccccccccccccc2222222222222222ccccccccccbb33333344443333333333bbbbbb444444443344443333333333bb
cccccccccccccccccccccccccccccccccccccccccccccccc2222222222222222ccccccccccbb3333333333333344443344bb44444444333333333333333333bb
cccccccccccccccccccccccccccccccccccccccccccccccc2222222222222222ccccccccccbb3333333333333344443344bb44444444333333333333333333bb
cccccccccccccccccccccccccccccccccccccccccccccccc2222222222222222ccccccccccbbbbbbbb3333333333334444444444bbbb333333333344443333bb
cccccccccccccccccccccccccccccccccccccccccccccccc2222222222222222ccccccccccbbbbbbbb3333333333334444444444bbbb333333333344443333bb
ccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffccccccccccccccccbbbbbbbb333333bb444444bbbbbbbb333333333333bbbbbb
ccccccccccccccccccccccccccccccccccccccccccccccccffffffffffffffffccccccccccccccccbbbbbbbb333333bb444444bbbbbbbb333333333333bbbbbb
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbb444444bbccccbbbbbbbbbbbbbbbbcccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbb444444bbccccbbbbbbbbbbbbbbbbcccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb444444bbcccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb444444bbcccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb444444bbcccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb444444bbcccccccccccccccccccccccc
aaaaaaccccccccccaaaaaaccccccccccaaaaccccaaaaaaccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbb444444bbbbbbbbbbbbbbbbbbcccccccc
aaaaaaccccccccccaaaaaaccccccccccaaaaccccaaaaaaccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbb444444bbbbbbbbbbbbbbbbbbcccccccc
aaccaaccccccccccccccaaccccccccccccaaccccaaccccccccccccccccccccccccccccccccccccbb22222222222222222222222222222222222222bbcccccccc
aaccaaccccccccccccccaaccccccccccccaaccccaaccccccccccccccccccccccccccccccccccccbb22222222222222222222222222222222222222bbcccccccc
aaccaaccccccccccccaaaaccccccccccccaaccccaaaaaaccccccccccccccccccccccccccccccccbb22222222222222222222222222222222222222bbcccccccc
aaccaaccccccccccccaaaaccccccccccccaaccccaaaaaaccccccccccccccccccccccccccccccccbb22222222222222222222222222222222222222bbcccccccc
aaccaaccccccccccccccaaccccccccccccaaccccccccaaccccccccccccccccccccccccccccccccbbbb2222222222222222222222222222222222bbbbcccccccc
aaccaaccccccccccccccaaccccccccccccaaccccccccaaccccccccccccccccccccccccccccccccbbbb2222222222222222222222222222222222bbbbcccccccc
aaaaaaccccaaccccaaaaaaccccaaccccaaaaaaccaaaaaaccccccccccccccccccccccccccccccccccbbbbbb222222bbbbbbbbbbbbbb222222bbbbbbcccccccccc
aaaaaaccccaaccccaaaaaaccccaaccccaaaaaaccaaaaaaccccccccccccccccccccccccccccccccccbbbbbb222222bbbbbbbbbbbbbb222222bbbbbbcccccccccc

__gff__
0101010303030404040404040404000001800101000004040404040404040000010101010000000000040404040400000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010113000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010112000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
0101010101010122000000000000000000002020202020202020202020202020201010101010101010101010101010101010303030303030303030303030303030303021212121212121212121212121212121210000000000000000000000000000000000000000000000000000000000000000000000010101010101010101
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
003c0020005300053013530135301c5301c530135301353017530175301f5301f5301c5301c5301f5301f530005300053013530135301c5301c530135301353017530175301f5301f5301c5301c5301f5301f530
003c00200c7600c76213740137420c7600c762137401374207760077620e7400e74207760077620e7400e7420c7600c76210740107420c7600c762107401074207760077620e7400e74207760077620e7400e742
003c00201c7301c73218730187321c7301c73218730187321a7301a73217730177321a7301a73217730177321c7301c73218730187321c7301c73218730187321a7301a73217730177321a7301a7321773017732
0005000000640000000000000000000000000000000000001a6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001e0020247451800523745217451f7451d7451c7451d7451f745180051f745217451f745180051153510535115350c005115351353511535105350e53510535115350c0051153513535115350c005105350e535
__music__
02 02010443
00 43424344

