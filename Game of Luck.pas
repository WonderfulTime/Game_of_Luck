uses GraphABC,ABCobjects ;
var xPlayer, yPlayer, speedPlayer,navigation,hod,intr,num,proverka:integer;
mxPlayer,myPlayer : integer;
save1,save2,save3,save4,save5:text;
proza: boolean;
Home,Map,Mart,Work,Funclub,hospital:boolean;
nadejda,GM,vrem,m,nedostatok:boolean;
spat,men,est,pit,have,bank,nework,rabotat,zaim,heal :boolean;
spritePlayer,spriteFon: string;
hp_s,water_s,food_s,son_s,gold_s,kar_s,zarp_s,nastr_s:string;
txt: array [1..100] of TextABC;
hp,gold,food,water,son,nastr,zarp,kar,voz,year,month,chislo,t1,t2,jitie,car,med,dr,mr,credit,schet,dolg,r,kon,prichina,skill,cena,tchk:integer;
interier: array [1..9] of PictureABC;
gran : array [1..14]of PictureABC;
stena: array [1..10] of PictureABC;
objectPlayer,svitok, fon,chas, plan,main: PictureABC;
kvad: array [1..6] of BoundedObjectABC ;
label sozdanie,make,making;
//начало объявления процедур


procedure winGame();
begin 
window.Caption := 'Game of Luck';
window.setsize(800,600);
window.CenterOnScreen;
window.IsFixedSize := true;
end;

procedure CleanWord();
begin
 num:=1;
 repeat
 try
 txt[num].Destroy();
 except exit;
 end;
 num:=num+1;
 until num=21;
end;


procedure Time();
begin
vrem:=true;
spriteFon:='заготовки по картинкам/Игровая среда/время/часы.png';
chas:=PictureAbc.Create(0,0,spriteFon);
sleep(1000);
spriteFon:='заготовки по картинкам/Игровая среда/время/часы2.png';
chas.ChangePicture(spriteFon);
sleep(1000);
spriteFon:='заготовки по картинкам/Игровая среда/время/часы3.png';
chas.ChangePicture(spriteFon);
sleep(1000);
spriteFon:='заготовки по картинкам/Игровая среда/время/часы4.png';
chas.ChangePicture(spriteFon);
sleep(1000);
chas.Destroy();
vrem:=false;
while t1>60 do
 begin
  t1:=t1-60;
  t2:=t2+1;
 end;
if t2>=24 then 
 begin
  if gold<0 then dolg:=dolg+1;
  t2:=t2-24;
  chislo:=chislo+1;
  kon:=0;
  if credit>0 then 
   begin 
    gold:=gold-6;
    credit:=credit-5;
   end;
 end;
if (month=2)and(chislo>28) then
 begin
  chislo:=chislo-28;
  month:=month+1;
  if jitie=1 then gold:=gold-150;
  if jitie=2 then gold:=gold-250;  
  if schet=1 then gold:=gold+(3*zarp);
 end;
if ((month=4)or(month=6)or(month=9)or(month=11))and(chislo>30) then
 begin
  chislo:=chislo-30;
  month:=month+1;
  if jitie=1 then gold:=gold-150;
  if jitie=2 then gold:=gold-250;
  if schet=1 then gold:=gold+(3*zarp);
 end;
if ((month=1)or(month=3)or(month=5)or(month=7)or(month=8)or(month=10)or(month=12))and(chislo>31) then
 begin
  chislo:=chislo-31;
  month:=month+1;
  if jitie=1 then gold:=gold-150;
  if jitie=2 then gold:=gold-250;  
  if schet=1 then gold:=gold+(3*zarp);  
 end; 
if month>12 then
 begin
  year:=year+1;
  month:=1;
 end;
if r=1 then
   begin
    if food<1 then
     food:=1;
    if water<1 then 
     water:=1;
    if gold>60 then
     gold:=60; 
   end;
if nastr<0 then 
   kar:=kar-2;
if gold<0 then
   begin
   hp:=hp-10;
   nastr:=nastr-15;
   end; 
if (son<20)and(son>0) then 
   begin
    kar:=kar-5;
    nastr:=nastr-10;    
   end;
if son<=0 then
   begin
    kar:=kar-10;
    hp:=hp-20;
    nastr:=nastr-15;
   end;
if kar<0 then 
  begin
   nastr:=nastr-10;
   kar:=0;
  end;
if (kon=0)and(dr=chislo)and(mr=month) then
   begin
    voz:=voz+1;
    kon:=kon+1;
    gold:=random(20,35);
    nastr:=100;
    hp:=hp+20;
   end;
if food<0 then hp:=hp-5;
if water<0 then hp:=hp-7;
if son>100 then
   son:=100; 
if kar>100 then 
   kar:=100;
if hp>100 then 
   hp:=100;
nedostatok:=false;
cleanword();
end;


procedure MakeFunclub();
begin
Funclub:=True;
spriteFon:='заготовки по картинкам/Игровая среда/казино/границы/границы1.png';
gran[1]:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/границы/границы2.png';
gran[2]:=PictureABC.Create(73,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/границы/границы3.png';
gran[3]:=PictureABC.Create(553,184,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/границы/границы4.png';
gran[4]:=PictureABC.Create(201,472,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/казино.png';
fon:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/стойка.png';
interier[1]:=PictureABC.Create(73,158,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/автоматы.png';
interier[2]:=PictureABC.Create(340,120,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/бильярд.png';
interier[3]:=PictureABC.Create(399,264,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/казино/стена.png';
stena[1]:=PictureABC.Create(201,407,spriteFon);
xPlayer := 115;
yPlayer := 505;
objectPlayer.MoveTo(xPLayer,yPlayer);
ObjectPlayer.ToFront();
end;

procedure FunclubClear();
begin
Funclub:=False;
fon.Destroy();
intr:=1;
repeat
interier[intr].Destroy();
intr:=intr+1;
until intr=4;
num:=1;
repeat
gran[num].Destroy();
num:=num+1;
until num=5;
stena[1].Destroy();
end;

procedure MakeWork();
begin
Work:=True;
spriteFon:='заготовки по картинкам/Игровая среда/работа/границы/границы1.png';
gran[1]:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/границы/границы2.png';
gran[2]:=PictureABC.Create(0,102,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/границы/границы3.png';
gran[3]:=PictureABC.Create(0,198,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/границы/границы4.png';
gran[4]:=PictureABC.Create(163,582,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/границы/границы5.png';
gran[5]:=PictureABC.Create(675,198,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/границы/границы6.png';
gran[6]:=PictureABC.Create(163,354,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/работа.png';
fon:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/интерьер.png';
interier[1]:=PictureABC.Create(547,48,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/интерьер2.png';
interier[2]:=PictureABC.Create(578,87,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/интерьер3.png';
interier[3]:=PictureABC.Create(393,147,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/сборка1.png';
interier[4]:=PictureABC.Create(163,145,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/сотрудник.png';
interier[5]:=PictureABC.Create(485,156,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/сборка2.png';
interier[6]:=PictureABC.Create(163,292,spriteFon);
objectPlayer.ToFront;
spriteFon:='заготовки по картинкам/Игровая среда/работа/стена.png';
stena[1]:=PictureABC.Create(674,134,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа/стена2.png';
stena[2]:=PictureABC.Create(157,518,spriteFon);
xPlayer:=742;
yPlayer:=70;
objectPlayer.MoveTo(xPlayer,yPlayer)
end;


procedure WorkClear();
begin
Work:=False;
fon.Destroy();
intr:=1;
repeat
interier[intr].Destroy();
intr:=intr+1;
until intr=7;
num:=1;
repeat
gran[num].Destroy();
num:=num+1;
until num=7;
num:=1;
repeat
stena[num].Destroy();
num:=num+1;
until num=3;
end;


Procedure MakeMart();
begin
Mart:=True;
spriteFon:='заготовки по картинкам/Игровая среда/магазин/границы/грань1.png';
gran[1]:=PictureABC.Create(0,500,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/границы/грань2.png';
gran[2]:=PictureABC.Create(0,245,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/границы/грань3.png';
gran[3]:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/границы/грань4.png';
gran[4]:=PictureABC.Create(622,245,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/границы/грань5.png';
gran[5]:=PictureABC.Create(479,500,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/границы/грань6.png';
gran[6]:=PictureABC.Create(374,371,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/магазин.png';
Fon:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/стойка.png';
interier[1]:=PictureABC.Create(143,186,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/автоматы3.png';
interier[2]:=PictureABC.Create(305,215,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/автоматы.png';
interier[3]:=PictureABC.Create(374,184,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/автоматы2.png';
interier[4]:=PictureABC.Create(374,304,spriteFon);
objectPlayer.ToFront;
spriteFon:='заготовки по картинкам/Игровая среда/магазин/стена.png';
stena[1]:=PictureABC.Create(138,437,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин/стена2.png';
stena[2]:=PictureABC.Create(479,437,spriteFon);
xPlayer:=350;
yPlayer:=537;
objectPlayer.MoveTo(350,537)
end;


Procedure MartClear();
begin
Mart:=False;
fon.Destroy();
intr:=1;
repeat
interier[intr].Destroy();
intr:=intr+1;
until intr=5;
num:=1;
repeat
gran[num].Destroy();
num:=num+1;
until num=7;
num:=1;
repeat
stena[num].Destroy();
num:=num+1;
until num=3;
end;

procedure MakeHospital();
begin
hospital:=true;
spriteFon:='заготовки по картинкам/Игровая среда/больница/границы/граница1.png';
gran[1]:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/границы/граница2.png';
gran[2]:=PictureABC.Create(128,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/границы/граница3.png';
gran[3]:=PictureABC.Create(720,206,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/границы/граница4.png';
gran[4]:=PictureABC.Create(0,421,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/Больница.png';
Fon:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/Стойка.png';
interier[1]:=PictureABC.Create(624,190,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/Ширма.png';
interier[2]:=PictureABC.Create(565,173,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/МРТ.png';
interier[3]:=PictureABC.Create(540,190,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/сборка 1.png';
interier[4]:=PictureABC.Create(128,177,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/сборка 2.png';
interier[5]:=PictureABC.Create(128,223,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница/Кулер.png';
interier[6]:=PictureABC.Create(400,176,spriteFon);
objectPlayer.ToFront;
spriteFon:='заготовки по картинкам/Игровая среда/больница/стена.png';
stena[1]:=PictureABC.Create(0,357,spriteFon);
xPlayer:=30;
yPlayer:=300;
objectPlayer.MoveTo(30,300)
end;


procedure HospitalClear();
begin
hospital:=False;
fon.Destroy();
intr:=1;
repeat
interier[intr].Destroy();
intr:=intr+1;
until intr=7;
num:=1;
repeat
gran[num].Destroy();
num:=num+1;
until num=5;
stena[1].Destroy();
end;


Procedure MakeMap();
begin
Map:=True;
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава1.png';
gran[1]:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава2.png';
gran[2]:=PictureABC.Create(374,80,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава3.png';
gran[3]:=PictureABC.Create(413,44,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава4.png';
gran[4]:=PictureABC.Create(589,195,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава5.png';
gran[5]:=PictureABC.Create(674,212,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава6.png';
gran[6]:=PictureABC.Create(494,254,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава7.png';
gran[7]:=PictureABC.Create(415,236,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава8.png';
gran[8]:=PictureABC.Create(429,278,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава9.png';
gran[9]:=PictureABC.Create(445,341,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава10.png';
gran[10]:=PictureABC.Create(430,509,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава11.png';
gran[11]:=PictureABC.Create(162,525,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава12.png';
gran[12]:=PictureABC.Create(0,486,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава13.png';
gran[13]:=PictureABC.Create(0,286,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/трава/трава14.png';
gran[14]:=PictureABC.Create(0,244,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/карта.png';
fon:=PictureABC.Create(0,0,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/дом(дом).png';
interier[1]:=PictureABC.Create(350,63,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/магазин(дом).png';
interier[2]:=PictureABC.Create(62,171,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/работа(дом).png';
interier[3]:=PictureABC.Create(580,63,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/атракционны(дом) .png';
interier[4]:=PictureABC.Create(100,410,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/больница(дом).png';
interier[5]:=PictureABC.Create(511,298,spriteFon);
objectPlayer.ToFront;
xPlayer:=mxPlayer;
yPlayer:=myPlayer;
objectPlayer.MoveTo(xPlayer,yPlayer);
end;

Procedure MapClear();
begin
Map:=False;
fon.Destroy();
intr:=1;
repeat
interier[intr].Destroy();
intr:=intr+1;
until intr=6;
num:=1;
repeat
gran[num].Destroy();
num:=num+1;
until num=15;
mxPlayer:=xPLayer;
myPlayer:=yPlayer;
end;


Procedure Dom();
begin
Home:=true;
spriteFon:='заготовки по картинкам/Игровая среда/дом.png';
fon:=PictureABC.Create(-1,-30,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/кровать.png';
interier[3]:=PictureABC.Create(545,135,spriteFon);
xPlayer := 400;
yPlayer := 300;
objectPlayer.MoveTo(xPlayer,yPlayer);
objectPlayer.ToFront;
spriteFon:='заготовки по картинкам/Игровая среда/стена.png';
interier[1]:=PictureABC.Create(0,290,spriteFon);
spriteFon:='заготовки по картинкам/Игровая среда/стена2.png';
interier[2]:=PictureABC.Create(256,415,spriteFon);
end;

procedure DomClear();
begin
Home:=false;
fon.Destroy();
intr:=1;
repeat
interier[intr].Destroy();
intr:=intr+1;
until intr=4;
end;


procedure Prozrachnost();
begin
if Hospital=true then
begin
 if (stena[1].Intersect(objectPlayer)=true)and(proza=false) then
 begin
  spriteFon:='заготовки по картинкам/Игровая среда/больница/Стена(полу).png';
  proza:=true;
  stena[1].ChangePicture(spriteFon);
  end;
 if (stena[1].Intersect(objectPlayer)=false)and(proza=true) then
 begin
  spriteFon:='заготовки по картинкам/Игровая среда/больница/Стена.png';
  proza:=false;
  stena[1].ChangePicture(spriteFon);
  end;
end;
if Home=true then
begin
 if (interier[1].Intersect(objectPlayer)=true)and(proza=false) then
  begin
  spriteFon:='заготовки по картинкам/Игровая среда/стена(полу).png';
  proza:=true;
  interier[1].ChangePicture(spriteFon);
  end;
 if (interier[2].Intersect(objectPlayer)=true)and(proza=false) then
  begin
  spriteFon:='заготовки по картинкам/Игровая среда/стена(полу)2.png';
  proza:=true;
  interier[2].ChangePicture(spriteFon);
  end;
 if (interier[2].Intersect(objectPlayer)=false)and(interier[1].Intersect(objectPlayer)=false)and(proza=true) then
  begin
  proza:=false;
  spriteFon:='заготовки по картинкам/Игровая среда/стена2.png';
  interier[2].ChangePicture(spriteFon);
  spriteFon:='заготовки по картинкам/Игровая среда/стена.png';
  interier[1].ChangePicture(spriteFon);
  end;
end;
if Mart=true then
 begin
  if (stena[1].Intersect(objectPlayer)=true)and(proza=false) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/Магазин/стена(полу).png';
   proza:=true;
   stena[1].ChangePicture(spriteFon);
   stena[1].ToFront;
   end;
  if (stena[2].Intersect(objectPlayer)=true)and(proza=false) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/Магазин/стена2(полу).png';
   proza:=true;
   stena[2].ChangePicture(spriteFon);
   stena[2].ToFront;
   end;
  if (interier[4].PtInside(xPlayer+objectPlayer.Width-5,yPlayer+objectPlayer.Height)=true)and(proza=false) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/Магазин/автоматы2(полу).png';
   proza:=true;
   interier[4].ChangePicture(spriteFon);
   interier[4].ToFront;
   end;
  if (interier[4].PtInside(xPlayer+objectPlayer.Width-5,yPlayer+objectPlayer.Height)=false)and(stena[2].Intersect(objectPlayer)=false)and(stena[1].Intersect(objectPlayer)=false)and(proza=true) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/Магазин/автоматы2.png';
   proza:=false;
   interier[4].ChangePicture(spriteFon);
   objectPlayer.ToFront;
   spriteFon:='заготовки по картинкам/Игровая среда/Магазин/стена2.png';
   stena[2].ChangePicture(spriteFon);
   spriteFon:='заготовки по картинкам/Игровая среда/Магазин/стена.png';
   stena[1].ChangePicture(spriteFon);
   objectPlayer.ToFront;
   end;
 end;
if Work=true then
 begin
  if (stena[1].Intersect(objectPlayer)=true)and(proza=false) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/работа/стена(полу).png';
   proza:=true;
   stena[1].ChangePicture(spriteFon);
   stena[1].ToFront;
   end;
  if (stena[2].Intersect(objectPlayer)=true)and(proza=false) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/работа/стена2(полу).png';
   proza:=true;
   stena[2].ChangePicture(spriteFon);
   stena[2].ToFront;
   end;
  if (interier[6].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true)and(proza=false) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/работа/сборка2(полу).png';
   proza:=true;
   interier[6].ChangePicture(spriteFon);
   interier[6].ToFront;
   end;
  if (interier[6].PtInside(xPlayer,yPlayer+objectPlayer.Height)=false)and(stena[2].Intersect(objectPlayer)=false)and(stena[1].Intersect(objectPlayer)=false)and(proza=true) then
   begin
   spriteFon:='заготовки по картинкам/Игровая среда/работа/сборка2.png';
   proza:=false;
   interier[6].ChangePicture(spriteFon);
   objectPlayer.ToFront;
   spriteFon:='заготовки по картинкам/Игровая среда/работа/стена2.png';
   stena[2].ChangePicture(spriteFon);
   spriteFon:='заготовки по картинкам/Игровая среда/работа/стена.png';
   stena[1].ChangePicture(spriteFon);
   objectPlayer.ToFront;
   end;
 end;
if Funclub=true then
 begin
 if (interier[3].PtInside(xPlayer+objectPLayer.Width,yPlayer+objectPLayer.Height))and(proza=false) then
  begin
   proza:=true;
   interier[3].ToFront;
  end;
 if (stena[1].PtInside(xPlayer+objectPLayer.Width,yPlayer+objectPLayer.Height))and(proza=false) then
  begin
   proza:=true;
   spriteFon:='заготовки по картинкам/Игровая среда/казино/стена(полу).png';
   stena[1].ChangePicture(spriteFon);
  end;
 if (interier[3].PtInside(xPlayer+objectPLayer.Width,yPlayer+objectPLayer.Height)=false)and(stena[1].PtInside(xPlayer+objectPLayer.Width,yPlayer+objectPLayer.Height)=false)and(proza=true) then
  begin
   proza:=false;
   objectPlayer.ToFront;
   stena[1].ToFront;
   spriteFon:='заготовки по картинкам/Игровая среда/казино/стена.png';
   stena[1].ChangePicture(spriteFon);
  end;
 end;
end;


procedure Words();
begin
 STR(hp,hp_s);
 STR(water,water_s);
 STR(food,food_s);
 STR(zarp,zarp_s);
 STR(gold,gold_s);
 STR(kar,kar_s);
 STR(son,son_s);
 STR(nastr,nastr_s);
 txt[1]:=ABCobjects.TextABC.Create(156,170,9,'Здоровье_____'+hp_s,clBlack);
 txt[2]:=ABCobjects.TextABC.Create(156,txt[1].Top+txt[1].Height,9,'Жажда_______'+water_s,clBlack);
 txt[3]:=ABCobjects.TextABC.Create(156,txt[2].Top+txt[1].Height,9,'Сытость______'+food_s,clBlack);
 txt[4]:=ABCobjects.TextABC.Create(156,txt[3].Top+txt[1].Height,9,'Зарплата_____'+zarp_s,clBlack);
 txt[5]:=ABCobjects.TextABC.Create(156,txt[4].Top+txt[1].Height,9,'Денег________'+gold_s,clBlack);
 txt[6]:=ABCobjects.TextABC.Create(156,txt[5].Top+txt[1].Height,9,'Карьера______'+kar_s,clBlack);
 txt[7]:=ABCobjects.TextABC.Create(156,txt[6].Top+txt[1].Height,9,'Сон__________'+son_s,clBlack);
 txt[8]:=ABCobjects.TextABC.Create(156,txt[7].Top+txt[1].Height,9,'Настроение___'+nastr_s,clBlack);
 txt[9]:=ABCobjects.TextABC.Create(156,txt[8].Top+txt[1].Height,9,'Транспорт____',clBlack);
 if car=0 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Нет',clBlack);
 if car=1 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Скейтборд',clBlack);
 if car=2 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Велосипед',clBlack);
 if car=3 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Москвич',clBlack);
 if car=4 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Vitx',clBlack);
 if car=5 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Hammur',clBlack);
 if car=6 then txt[14]:=ABCobjects.TextABC.Create(txt[9].Left+txt[9].Width,txt[9].Top,9,'Волга new',clBlack);
 txt[10]:=ABCobjects.TextABC.Create(156,txt[9].Top+txt[1].Height,9,'Проживание__',clBlack);
 if jitie=0 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Коробка',clBlack);
 if jitie=1 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Общага',clBlack);
 if jitie=2 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Съемная',clBlack);
 if jitie=3 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Однушка',clBlack);
 if jitie=4 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Двушка',clBlack);
 if jitie=5 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Трешка',clBlack);
 if jitie=6 then txt[15]:=ABCobjects.TextABC.Create(txt[10].Left+txt[10].Width,txt[10].Top,9,'Коттедж',clBlack);
 txt[11]:=ABCobjects.TextABC.Create(156,txt[10].Top+txt[1].Height,9,'Болезни______',clBlack);
 txt[16]:=ABCobjects.TextABC.Create(txt[11].Left+txt[11].Width,txt[11].Top,9,'Нет',clBlack);
 txt[12]:=ABCobjects.TextABC.Create(156,txt[11].Top+txt[1].Height,9,'Должность____',clBlack);
 txt[13]:=ABCobjects.TextABC.Create(490,170,9,'Способность',clBlack);
 if r=1 then begin
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Дворник',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,200,9,'Сытость и жажда всегда боль-',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,215,9,'ше 0,но вы не можете зарабо-',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,230,9,'тать больше 60$',clBlack);
 end;
 if r=2 then begin
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Продавец',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'Во время работы есть шанс',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'взять еды, или обсчитать кли-',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'ента, или нахамить покупателю',clBlack);
 end;
 if r=3 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Учитель',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'От работы теряется настро-',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'ение,низкий шанс найти те-',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'лефон и продать его',clBlack);
 end;
 if r=4 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Полицейский',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'50% того что возьмет взятку',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'при работе(+20$), для новой',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'работы нужно  500$',clBlack);
 end;
 if r=5 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Программист',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'При работе выполняет контра',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'кты(+20-30$)',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'',clBlack);
 end;
 if r=6 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Директор магазина',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'При работе есть шанс попол-',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'нить все на +10 ',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'',clBlack);
 end;
 if r=7 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Мер города',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'10% того что возьмет взятку',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'при работе, при работе вос-',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'полняет сон',clBlack);
 end;
 if r=8 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Министр образования',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'При работе придумывает но-',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'вые законы, +20 к настрое-',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'нию, -10 ко сну',clBlack);
 end;
 if r=9 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Вице-президент',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'Работа теперь требует боль-',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'ше затрат',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'',clBlack);
 end;
 if r=10 then begin 
 txt[17]:=ABCobjects.TextABC.Create(txt[12].Left+txt[12].Width,txt[12].Top,9,'Президент',clBlack);
 txt[18]:=ABCobjects.TextABC.Create(468,170,9,'Все действия требуют боль-',clBlack);
 txt[19]:=ABCobjects.TextABC.Create(468,185,9,'ше затрат, кроме денег,',clBlack);
 txt[20]:=ABCobjects.TextABC.Create(468,200,9,'много сюрпризов при работе',clBlack);
 end;
end;


procedure svitk();
begin
if nadejda=false then
 begin
  nadejda:=true;
  spriteFon:='заготовки по картинкам/Игровая среда/книга.png';
  svitok:=PictureABC.Create(75,50,spriteFon);
  words();
 end
else if nadejda=true then 
 begin
 nadejda:=false;
 svitok.Destroy();
 cleanword();
 end;
end;


procedure MouseDown2(x,y,mb:integer);
begin
if est=true then
 begin
  if kvad[1].PtInside(x,y)=true then 
       begin
        if gold-10<0 then 
         nedostatok:=true
        else
        m:=false;
        est:=false;
        begin
         gold:=gold-10;
         food:=food+2;
         water:=water+1;
         t1:=t1+20;
         if (t2>22)or(t2<8) then 
         son:=son-2;
         Time();
       end;
       end
  else if kvad[2].PtInside(x,y)=true then 
       begin
       if gold-45>=0 then 
        begin
        m:=false;
        est:=false;
        gold:=gold-45;
         food:=food+10;
         t1:=t1+10;
         nastr:=nastr+5;
         if (t2>22)or(t2<8) then 
         son:=son-1;
         Time();
        end
        else nedostatok:=true;
       end
  else if kvad[3].PtInside(x,y)=true then 
       begin
        if gold-100>=0 then 
        begin
        m:=false;
        est:=false; 
        gold:=gold-100;
         food:=food+15;
         t2:=t2+1;
         if (t2>22)or(t2<8) then son:=son-5;
         Time();
        end
        else nedostatok:=true;
      end
  else if kvad[4].PtInside(x,y)=true then 
       begin
        
        if gold-175>=0 then 
        begin
        m:=false;
        est:=false;
        gold:=gold-175;
        food:=food+25;
        water:=water-15;
        t1:=t1+30;
        t2:=t2+1;
        if (t2>22)or(t2<8) then 
        son:=son-8;
        Time();
        end
        else nedostatok:=true;
      end
  else if kvad[5].PtInside(x,y)=true then 
       begin
        m:=false;
        est:=false;
        if gold-210<0 then 
        nedostatok:=true else
        begin
        m:=false;
        est:=false;
        gold:=gold-210;
        food:=food+50;
        t2:=t2+2;
        if (t2>22)or(t2<8) then 
        son:=son-10;
        Time();
        end;
      end;
 end;
if pit=true then
 begin
  if kvad[1].PtInside(x,y)=true then 
       begin       
        cena:=10;
        gold:=gold-10;
        if gold<0 then begin gold:=gold+cena; nedostatok:=true; end else
        begin
        m:=false;
        pit:=false;
        water:=water+4;
        t1:=t1+10;
        if (t2>22)or(t2<8) then 
           son:=son-1;
        Time();
        end;
       end
  else if kvad[2].PtInside(x,y)=true then 
       begin
        cena:=15;
        gold:=gold-15;
        if gold<0 then begin gold:=gold+cena; nedostatok:=true; end else
        begin
        m:=false;
        pit:=false;
        water:=water+6;
             t1:=t1+10;
             if (t2>22)or(t2<8) then 
                son:=son-1;
        Time();
        end;
      end
  else if kvad[3].PtInside(x,y)=true then 
       begin       
        cena:=75;
        gold:=gold-75;
        if gold<0 then begin gold:=gold+cena; nedostatok:=true; end else
        begin
        m:=false;
        pit:=false; 
        water:=water+10;
             t1:=t1+15;
             if (t2>22)or(t2<8) then 
                son:=son-2;
        Time();
        end;
      end
  else if kvad[4].PtInside(x,y)=true then 
       begin
        cena:=100;
        gold:=gold-100;
        if gold<0 then begin gold:=gold+cena; nedostatok:=true; end else
        begin
         m:=false;
        pit:=false;
        water:=water+15;
        nastr:=nastr+20;
        t1:=t1+30;
        if (t2>22)or(t2<8) then 
        son:=son-3;
        Time();
        end;
      end
  else if kvad[5].PtInside(x,y)=true then 
       begin
        cena:=180;
        gold:=gold-180;
        if gold<0 then begin gold:=gold+cena; nedostatok:=true; end else
        begin
        m:=false;
        pit:=false;
        water:=water+25;
             food:=food+5;
             nastr:=nastr+2;
             t1:=t1+15;
             if (t2>22)or(t2<8) then 
                son:=son-2;
        Time();
        end;
      end;
 end;
if nedostatok=true then 
begin
try txt[7].Destroy() except  end;
txt[7]:=ABCobjects.TextABC.Create(540,50+300,9,'Недостаточно денег',clWhite);
end else
if m=false then begin plan.Destroy(); end;
end;

procedure MouseDown(x,y,mb:integer);
begin
if spat=true then
 begin
  if kvad[1].PtInside(x,y)=true then 
       begin
        m:=false;
        spat:=false;
        t2:=t2+3;
        son:=son+5;
        food:=food-2;
        water:=water-2;
        Time();
       end;
  if kvad[2].PtInside(x,y)=true then 
       begin
        m:=false;
        spat:=false;
        t2:=t2+6;
        son:=son+10;
        food:=food-5;
        water:=water-5;
        Time();
      end;
  if kvad[3].PtInside(x,y)=true then 
       begin
        m:=false;
        spat:=false; 
        t2:=t2+12;
        son:=son+20;
        food:=food-5;
        water:=water-5;
        Time();
      end;
  if kvad[4].PtInside(x,y)=true then 
       begin
        m:=false;
        spat:=false;
        chislo:=chislo+1;
        food:=food-10;
        water:=water-10;
        son:=100;
        Time();
      end;
  if m=false then plan.Destroy();
 end;
if have=true then
 begin
  if kvad[1].PtInside(x,y)=true then 
       begin
        m:=false;
        have:=false;
        nastr:=nastr+5;
        t2:=t2+2;
        water:=water-2;
        food:=food-2;
        if (t2>22)or(t2<8) then 
        son:=son-10;
        Time();
       end;
  if kvad[2].PtInside(x,y)=true then 
       begin
        m:=false;
        have:=false;
        cena:=50;
        gold:=gold-50;
        cena:=cena-gold;
        if gold<0 then  begin gold:=gold+cena; nedostatok:=true; end else
        begin
        nastr:=nastr+15;
        t2:=t2+2;
        water:=water-2;
        food:=food-2;
        if (t2>22)or(t2<8) then 
        son:=son-10;
        Time();
        end;
      end;
  if kvad[3].PtInside(x,y)=true then 
       begin
        m:=false;
        have:=false; 
        cena:=150;
        gold:=gold-150;
        if gold<0 then  begin gold:=gold+cena; nedostatok:=true; end else
        begin
        nastr:=nastr+20;
        t1:=t1+30;
        water:=water-2;
        food:=food-2;
        if (t2>22)or(t2<8) then
        son:=son-3;
        Time();
        end;
      end;
  if kvad[4].PtInside(x,y)=true then 
       begin
        m:=false;
        have:=false;
        cena:=200;
        gold:=gold-200;
        if gold<0 then begin gold:=gold+cena; nedostatok:=true; end else
        begin
        nastr:=nastr+30;
        t2:=t2+2;
        water:=water-4;
        food:=food-2;
        if (t2>22)or(t2<8) then 
        son:=son-10;
        Time();
        end;
      end;
  if m=false then plan.Destroy();
 end;
if men=true then 
 begin
  if kvad[1].PtInside(x,y) then
   begin
   cleanword();
     pit:=true;
     txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Напитки',clWhite);
     kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
     txt[2]:=ABCobjects.TextABC.Create(536,108,9,'Stripe(-10$)',clWhite);
     kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
     txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'Aloc-acoc(-15$)',clWhite);
     kvad[3]:= ABCObjects.BoundedObjectABC.Create(475+48,50+151,10,12);
     txt[4]:=ABCobjects.TextABC.Create(538,50+151,9,'Минералка(-75$)',clWhite);
     kvad[4]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
     txt[5]:=ABCobjects.TextABC.Create(539,50+196,9,'Конь и як(-100$)',clWhite);
     kvad[5]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
     txt[6]:=ABCobjects.TextABC.Create(540,50+245,9,'Квас(-180$)',clWhite);
     kvad[6]:= ABCObjects.BoundedObjectABC.Create(540,50+254,10,12);
     onmousedown:=mousedown2;
   end;
   if kvad[2].PtInside(x,y) then
   begin
   cleanword();
     est:=true;
     txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Закуски',clWhite);
     kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
     txt[2]:=ABCobjects.TextABC.Create(536,108,9,'Доширак(-10$)',clWhite);
     kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
     txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'Шаурма(-45$)',clWhite);
     kvad[3]:= ABCObjects.BoundedObjectABC.Create(475+48,50+151,10,12);
     txt[4]:=ABCobjects.TextABC.Create(538,50+151,9,'Пицца(-100$)',clWhite);
     kvad[4]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
     txt[5]:=ABCobjects.TextABC.Create(539,50+196,9,'Борщ(-175$)',clWhite);
     kvad[5]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
     txt[6]:=ABCobjects.TextABC.Create(540,50+245,9,'Стейк(-210$)',clWhite);
     kvad[6]:= ABCObjects.BoundedObjectABC.Create(540,50+254,10,12);
     onmousedown:=mousedown2;
   end;
   if m=false then plan.Destroy();
 end;
if bank=true then
 begin
  if (kvad[1].PtInside(x,y)=true)and(zaim=false) then 
       begin
        m:=false;
        bank:=false;
        gold:=gold+50; 
        credit:=50;
        zaim:=true;
       end;
  if (kvad[2].PtInside(x,y)=true)and(zaim=false) then 
       begin
        m:=false;
        bank:=false;
        gold:=gold+100; 
        credit:=100;
        zaim:=true;
        end;
  if (kvad[3].PtInside(x,y)=true)and(zaim=false) then 
       begin
        m:=false;
        bank:=false; 
        gold:=gold+150; 
        credit:=150;
        zaim:=true;
        end;
  if (kvad[4].PtInside(x,y)=true)and(zaim=false) then 
       begin
        m:=false;
        bank:=false;
        gold:=gold+200; 
        credit:=200;
        zaim:=true;
        end;
  if m=false then plan.Destroy();
 end;
if heal=true then
 begin
  if (kvad[1].PtInside(x,y)=true) then 
       begin
        if gold-50>0 then
        begin
        m:=false;
        heal:=false;
        gold:=gold-50; 
        hp+=10;
        end;
       end;
  if (kvad[2].PtInside(x,y)=true) then 
       begin
        if gold-100>0 then
        begin
        m:=false;
        heal:=false;
        gold:=gold-100; 
        hp+=20;
        end;
        end;
  if (kvad[3].PtInside(x,y)=true) then 
       begin
       if gold-150>0 then
        begin
        m:=false;
        heal:=false;
        gold:=gold-150; 
        hp+=50;
        end;
        end;
  if (kvad[4].PtInside(x,y)=true) then 
       begin
       if gold-200>0 then
        begin
        m:=false;
        heal:=false;
        gold:=gold+200; 
        hp:=100;
        end;
        end;
   if hp>100 then hp:=100;
  if m=false then plan.Destroy();
 end;
end;


procedure menu();
label nelzia;
 begin
   if rabotat = false then begin
   m:=true;
   spriteFon:='заготовки по картинкам/Игровая среда/планшет.png';
  plan:=PictureABC.Create(475,50,spriteFon);
  end;
  if heal=true then
   begin
    txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Лечиться',clWhite);
    kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
    txt[2]:=ABCobjects.TextABC.Create(536,108,9,'Гемотоген',clWhite);
    kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
    txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'Таблетки',clWhite);
    kvad[3]:= ABCObjects.BoundedObjectABC.Create(475+48,50+151,10,12);
    txt[4]:=ABCobjects.TextABC.Create(538,50+151,9,'Посетить врача',clWhite);
    kvad[4]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
    txt[5]:=ABCobjects.TextABC.Create(539,50+196,9,'Лечь в больницу',clWhite);
    onmousedown:=mousedown;
   end;
  if spat=true then
   begin
    txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Спать',clWhite);
    kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
    txt[2]:=ABCobjects.TextABC.Create(536,108,9,'3 часа',clWhite);
    kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
    txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'6 часов',clWhite);
    kvad[3]:= ABCObjects.BoundedObjectABC.Create(475+48,50+151,10,12);
    txt[4]:=ABCobjects.TextABC.Create(538,50+151,9,'12 часов',clWhite);
    kvad[4]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
    txt[5]:=ABCobjects.TextABC.Create(539,50+196,9,'Сутки',clWhite);
    onmousedown:=mousedown;
   end;
  if have =true then
   begin
    txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Развлечения',clWhite);
    kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
    txt[2]:=ABCobjects.TextABC.Create(536,108,9,'Кататься на эскалаторе',clWhite);
    kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
    txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'Сыграть в игру(-50$)',clWhite);
    kvad[3]:= ABCObjects.BoundedObjectABC.Create(475+48,50+151,10,12);
    txt[4]:=ABCobjects.TextABC.Create(538,50+151,9,'Купить петарды(-150$)',clWhite);
    kvad[4]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
    txt[5]:=ABCobjects.TextABC.Create(539,50+196,9,'Заказать салют(-200$)',clWhite);
    onmousedown:=mousedown;
   end;
  if men =true then
   begin
    txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Меню',CLWhite);
    kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
    txt[2]:=ABCobjects.TextABC.Create(536,108,9,'Напитки',CLWhite);
    kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
    txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'Закуски',CLWhite);
    onmousedown:=mousedown;
   end;
  if nework=true then 
   begin
   txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Повышение',ClWhite);
   if kar< 100 then begin txt[2]:=ABCobjects.TextABC.Create(536,108,9,'К сожалению у вас',ClWhite); txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'недостаточно опыта',ClWhite); end
   else if kar>=100 then
    begin
     if (r=2)and(car<1) then begin prichina:=1; goto nelzia; end;
     if (r=3)and(car<2) then begin prichina:=1; goto nelzia; end;
     if (r=4)and((car<3)or(jitie<1)) then begin prichina:=2; goto nelzia; end;
     if (r=5)and((car<4)or(jitie<2)) then begin prichina:=2; goto nelzia; end;
     if (r=6)and((car<5)or(jitie<3)) then begin prichina:=2; goto nelzia; end;
     if (r=7)and((car<6)or(jitie<4)) then begin prichina:=2; goto nelzia; end;
     if (r=8)and(jitie<5) then begin prichina:=3; goto nelzia; end;
     if (r=9)and(jitie<6) then begin prichina:=3; goto nelzia; end;
     r:=r+1;
     if r=2 then zarp:=15;
     if r=3 then zarp:=20;
     if r=4 then zarp:=25;
     if r=5 then zarp:=30;
     if r=6 then zarp:=35;
     if r=7 then zarp:=50;
     if r=8 then zarp:=80;
     if r=9 then zarp:=90;
     if r>=10 then zarp:=100;
    end
   else begin
   nelzia:
   if prichina=1 then txt[4]:=ABCobjects.TextABC.Create(536,108,9,'Прикупите транспорт получше',ClWhite);
   if prichina=2 then txt[4]:=ABCobjects.TextABC.Create(536,108,9,'Купите транспорт или жилище',ClWhite);
   if prichina=3 then txt[4]:=ABCobjects.TextABC.Create(536,108,9,'Прикупите дом получше',ClWhite);
   end;
   end;
  if bank=true then
  begin
   txt[1]:=ABCobjects.TextABC.Create(87+475,32+50,9,'Кредит',ClWhite);
   kvad[1]:= ABCObjects.BoundedObjectABC.Create(521,108,10,12);
   txt[2]:=ABCobjects.TextABC.Create(536,108,9,'50$',ClWhite);
   kvad[2]:= ABCObjects.BoundedObjectABC.Create(475+47,50+107,10,12);
   txt[3]:=ABCobjects.TextABC.Create(537,50+107,9,'100$',ClWhite);
   kvad[3]:= ABCObjects.BoundedObjectABC.Create(475+48,50+151,10,12);
   txt[4]:=ABCobjects.TextABC.Create(538,50+151,9,'150$',ClWhite);
   kvad[4]:= ABCObjects.BoundedObjectABC.Create(475+49,50+196,10,12);
   txt[5]:=ABCobjects.TextABC.Create(539,50+196,9,'200$',ClWhite);
   onmousedown:=mousedown;
  end;
  if rabotat=true then 
   begin
    gold:=gold+zarp;
    kar:=kar+3;
    if (r=1)or(r=2)or(r=3) then
           begin
            water:=water-3;
            food:=food-3;
           end
          else
           begin  
            water:=water-5;
            food:=food-6;
           end;
          if r=9 then kar:=kar+1 else kar:=kar+3;
          t2:=t2+3;          
          if (t2>22)or(t2<8) then
            son:=son-random(5)+1;
          if t2>=24 then 
           begin
            kon:=0;
            t2:=t2-24;
            chislo:=chislo+1;
            if credit>0 then 
             begin 
              gold:=gold-6;
              credit:=credit-5;
              if credit=0 then zaim:=false;
             end;
           end;
      rabotat:=false;
      Time();
   end;
 end;


procedure ishod(keyup: integer);
begin
if keyup = VK_ESCAPE then halt;
if (keyup = VK_Tab)and(m=false) then svitk();
if (nadejda=false)and(m=false) then begin
if keyup = VK_S then  
 begin
 spritePlayer:='заготовки по картинкам/Персонаж/Player1(2).png';
 ObjectPlayer.ChangePicture(spritePlayer);
 end;
if keyup = VK_D then  
 begin
 spritePlayer:='заготовки по картинкам/Персонаж/Player3(2).png';
 ObjectPlayer.ChangePicture(spritePlayer);
 end;
if keyup = VK_A then  
 begin
 spritePlayer:='заготовки по картинкам/Персонаж/Player2(2).png';
 ObjectPlayer.ChangePicture(spritePlayer);
 end;
if keyup = VK_W then  
 begin
 spritePlayer:='заготовки по картинкам/Персонаж/Player4(2).png';
 ObjectPlayer.ChangePicture(spritePlayer); 
 end;
end;
if (keyup = VK_E)and(nadejda=false) then  
 begin
 if Map=True then
  begin
  if (yPlayer>410)and(xPlayer>445) then
   begin
   MapClear();
   MakeHospital();
   exit;
   end;
  if (yPlayer<135) then 
   begin
   MapClear();
   Dom();
   end;
  if (xPlayer<215) then
   begin
   MapClear();
   MakeMart();
   end;
  if (xPlayer>610) then
   begin
   MapClear();
   MakeWork();
   end;
  if (xPlayer<240)and(yPlayer>300) then
   begin
   MapClear();
   MakeFunclub();
   end;
  end
 else if (hospital=true) then
  begin
  if (xPlayer<25) then
   begin
   HospitalClear();
   MakeMap();
   end;
  if (objectPlayer.Intersect(interier[1])=true)and(heal=false) then 
   begin
   heal:=true;
   menu();
   end;
  if (objectPlayer.Intersect(interier[1])=true)and(heal=true) then
   begin
   cleanword();
   heal:=false;
   m:=false;
   plan.Destroy();
   end;
  end
 else if  (Home=True) then
  begin 
  if xPlayer<50 then
   begin
    DomClear();
    MakeMap();
   end;
  if (interier[3].PtInside(xPlayer+objectPlayer.Width,yPlayer))and(spat=false) then
   begin
    spat:=true;
    menu();
   end
  else if (interier[3].PtInside(xPlayer+objectPlayer.Width,yPlayer))and(spat=true) then
   begin
   cleanword();
    spat:=false;
    m:=false;
    plan.Destroy();
   end;
  end
 else if (Mart=True) then
  begin
  if ((interier[1].PtInside(xPlayer,yPlayer))and(men=false)) then
   begin
    men:=true;
    menu(); 
   end
  else if (interier[1].PtInside(xPlayer,yPlayer))and(men=true) then
   begin
    cleanword();
    men:=false;
    pit:=false;
    est:=false;
    m:=false;
    plan.Destroy();
   end;
  if yPlayer>520 then
   begin
   MartClear();
   MakeMap();
   end;
  end
 else if (Work=True) then
  begin
  if (interier[5].PtInside(xPlayer+(objectPlayer.Width)div(2),yPlayer+10))and(nework=false) then begin
  nework:=true;
  menu();
  end else
  if (interier[5].PtInside(xPlayer+(objectPlayer.Width)div(2),yPlayer+10))and(nework=true) then begin
  cleanword();
  nework:=false;
  m:=false;
  plan.Destroy();
  end;
  if (xPlayer<275)and(interier[6].PtInside(xPlayer,yPlayer))and(proza=false)and(rabotat=false) then begin
  rabotat:=true;
  menu();
  end;
  if (interier[3].PtInside(xPlayer+(objectPlayer.Width)div(2),yPlayer+10))and(bank=false) then begin
  bank:=true;
  menu();
  end else if (interier[3].PtInside(xPlayer+(objectPlayer.Width)div(2),yPlayer+10))and(bank=true) then begin
  cleanword();
  bank:=false;
  m:=false;
  plan.Destroy();
  end;
  if xPLayer>735 then
   begin
   WorkClear();
   MakeMap();
   end;
  end
 else if (Funclub=true) then
  begin
  if (interier[1].PtInside(xPlayer,yPlayer))and(have=false) then
   begin
    have:=true;
    menu();
   end
  else if (interier[1].PtInside(xPlayer,yPlayer))and(have=true) then
   begin
    cleanword();
    have:=false;
    m:=false;
    plan.Destroy();
   end;
  if yPlayer>520 then
  begin
   FunclubClear();
   MakeMap();
   end;
  end;
 end; 
end;


procedure Navigate();
begin
if navigation = 1 then  
 begin
 if hod=2 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player1(2).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end
 else if hod=3 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player1(3).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=1;
  end
 else if hod=1 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player1(1).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end;
 end;
if navigation = 2 then  
 begin
 if hod=2 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player2(2).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end
 else if hod=3 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player2(3).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=1;
  end
 else if hod=1 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player2(1).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end;
 end;
if navigation = 3 then  
 begin
 if hod=2 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player3(2).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end
 else if hod=3 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player3(3).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=1;
  end
 else if hod=1 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player3(1).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end;
 end;
if navigation = 4 then  
 begin
 if hod=2 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player4(2).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end
 else if hod=3 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player4(3).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=1;
  end
 else if hod=1 then 
  begin 
   spritePlayer:='заготовки по картинкам/Персонаж/Player4(1).png';
   ObjectPlayer.ChangePicture(spritePlayer);
   hod:=3;
  end;
 end; 
end;


procedure Move(key : integer);
begin
if hp=0 then hALT();
if (nadejda=false)and(vrem=false)and(m=false) then begin
if key = VK_D then 
//=================================================================================================================================================================
 begin 
 if Hospital=true then
 begin
 if xPLayer+objectPlayer.Width<720 then xPlayer:=xPlayer+speedPlayer;
 if (interier[1].PtInside(xPlayer+objectPlayer.Width-10,yPlayer+objectPlayer.Height-12)=true)or(interier[3].PtInside(xPlayer+objectPlayer.Width-10,yPlayer+objectPlayer.Height-12)=true) then xPlayer:=xPlayer-speedPlayer;
 end;
 if Home=True then
 begin
 if (xPlayer+speedPlayer<540) then xPlayer:=xPlayer+speedPlayer;
 if interier[3].PtInside(xPlayer+objectPlayer.Width-10,yPlayer+objectPlayer.Height-12)=true then xPlayer:=xPlayer-speedPlayer;
 Prozrachnost();
 end;
 if Map=True then
 begin
 xPlayer:=xPlayer+speedPlayer;
 num:=1;
 repeat 
 if gran[num].PtInside(xPlayer+objectPlayer.Width-5,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer-speedPlayer;
 num:=num+1;
 until num=15;
 end;
 if Mart=true then
 begin
  xPlayer:=xPlayer+speedPlayer;
  num:=1;
  repeat
   if gran[num].PtInside(xPlayer+objectPlayer.Width,yPlayer+objectPlayer.Height)=true then xPlayer:=xPlayer-speedPlayer;
   num:=num+1;
  until num=7;
  intr:=1;
  repeat
   if interier[intr].PtInside(xPlayer+ObjectPlayer.Width,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer-speedPlayer;
   intr:=intr+1;
  until intr=4;
 Prozrachnost();
 end;
 if Work=true then
 begin
  xPlayer:=xPlayer+speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer+objectPlayer.Width,yPlayer+objectPlayer.Height)=true)or(xPlayer+ObjectPlayer.Width>800) then xPlayer:=xPlayer-speedPlayer;
   num:=num+1;
  until num=7;
  intr:=1;
  repeat
   if interier[intr].PtInside(xPlayer+ObjectPlayer.Width,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer-speedPlayer;
   intr:=intr+1;
  until intr=6;
 Prozrachnost();
 end;
 if Funclub=true then
 begin
  xPlayer:=xPlayer+speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer+objectPlayer.Width,yPlayer+objectPlayer.Height)=true)or(xPlayer+ObjectPlayer.Width>800) then xPlayer:=xPlayer-speedPlayer;
   num:=num+1;
  until num=5;
  intr:=1;
  repeat
   if interier[intr].PtInside(xPlayer+ObjectPlayer.Width,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer-speedPlayer;
   intr:=intr+1;
  until intr=4;
 Prozrachnost();
 end;
 navigation:=3;
 objectPlayer.MoveTo(xPlayer,yPlayer);
 Navigate();
 sleep(100);
 end;
 //=================================================================================================================================================================
if key = VK_S then 
 begin
 if Hospital=true then
 begin
 yPlayer:=yPlayer+speedPlayer;
 if (gran[4].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true)or(interier[5].PtInside(xPlayer+10,yPLayer+objectPlayer.Height)=true) then yPlayer:=yPlayer-speedPlayer;
 Prozrachnost();
 end;
 if Home=True then
 begin
 if ((yPlayer-speedPlayer<415)and(xPlayer>255))or((xPlayer<=255)and(yPlayer<290)) then yPlayer:=yPlayer+speedPlayer;
 Prozrachnost();
 end;
 if Map=True then
 begin
 yPlayer:=yPlayer+speedPlayer;
 num:=1;
 repeat 
 if (gran[num].PtInside(xPlayer+5,yPlayer+objectPlayer.Height)=true)or(gran[num].PtInside(xPlayer+27,yPlayer+objectPlayer.Height)=true) then yPlayer:=yPlayer-speedPlayer;
 num:=num+1;
 until num=15;
 end;
 if Mart=true then
  begin
  yPlayer:=yPlayer+speedPlayer;
  if yPlayer+objectPlayer.Height>600 then yPlayer:=yPlayer-speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true)or(gran[num].PtInside(xPlayer+objectPlayer.Width,yPlayer+objectPlayer.Height)=true) then yPlayer:=yPlayer-speedPlayer;
   num:=num+1;
  until num=7;
  Prozrachnost();
  end;
 if Work=true then
  begin
  yPlayer:=yPlayer+speedPlayer;
  if yPlayer+objectPlayer.Height>600 then yPlayer:=yPlayer-speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true)or(gran[num].PtInside(xPlayer+objectPlayer.Width,yPlayer+objectPlayer.Height)=true) then yPlayer:=yPlayer-speedPlayer;
   num:=num+1;
  until num=7;
  Prozrachnost();
  end;
 if Funclub=true then
 begin
  yPlayer:=yPlayer+speedPlayer;
  if yPlayer+objectPlayer.Height>600 then yPlayer:=yPlayer-speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true)or(gran[num].PtInside(xPlayer+objectPlayer.Width,yPlayer+objectPlayer.Height)=true) then yPlayer:=yPlayer-speedPlayer;
   num:=num+1;
  until num=5;
  intr:=1;
  repeat
   if (interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(interier[intr].PtInside(xPlayer+objectPlayer.Width-1,yPlayer+objectPlayer.Height-25)=true) then yPlayer:=yPlayer-speedPlayer;
   intr:=intr+1;
  until intr=4;
 Prozrachnost();
 end;
 navigation:=1;
 objectPlayer.MoveTo(xPlayer,yPlayer);
 Navigate();
 sleep(100);
 end;
//=================================================================================================================================================================
if key = VK_A then 
 begin
 if Hospital=true then
 begin
 if xPlayer-speedPlayer>0 then xPlayer:=xPLayer-speedPlayer;
 if gran[1].PtInside(xPLayer,yPLayer+objectPlayer.Height)=true then xPlayer:=xPLayer+speedPlayer;
 num:=4;
 repeat
 if interier[num].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true then xPLayer:=xPLayer+speedPlayer;
 num+=1
 until num=7;
 end;
 if Home=True then
 begin
 if (xPlayer-speedPlayer>255)and((yPlayer<255)or(yPlayer>295))or((yPlayer>=255)and(yPlayer<=295))  then xPlayer:=xPlayer-speedPlayer;
 if xPlayer<0 then xPlayer:=xPlayer+speedPlayer;
 Prozrachnost();
 end;
 if Map=True then
 begin
 xPlayer:=xPlayer-speedPlayer;
 num:=1;
 repeat 
 if gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer+speedPlayer;
 num:=num+1;
 until num=15;
 end;
 if Mart=true then
 begin
 xPlayer:=xPlayer-speedPlayer;
 num:=1;
 repeat
 if gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true then xPlayer:=xPlayer+speedPlayer;
 num:=num+1;
 until num=7;
 intr:=1;
  repeat
   if interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer+speedPlayer;
   intr:=intr+1;
  until intr=4;
 Prozrachnost();
 end;
 if Work=true then
 begin
 xPlayer:=xPlayer-speedPlayer;
 num:=1;
 repeat
 if gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true then xPlayer:=xPlayer+speedPlayer;
 num:=num+1;
 until num=7;
 intr:=1;
  repeat
   if interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer+speedPlayer;
   intr:=intr+1;
  until intr=6;
 Prozrachnost();
 end;
 if Funclub=true then
 begin
  xPlayer:=xPlayer-speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height)=true)or(xPlayer+ObjectPlayer.Width<0) then xPlayer:=xPlayer+speedPlayer;
   num:=num+1;
  until num=5;
  intr:=1;
  repeat
   if interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true then xPlayer:=xPlayer+speedPlayer;
   intr:=intr+1;
  until intr=3;
 Prozrachnost();
 end;
 navigation:=2;
 objectPlayer.MoveTo(xPlayer,yPlayer);
 Navigate();
 sleep(100);
 end;
//=================================================================================================================================================================
if key = VK_W then 
 begin
 if Hospital=true then
 begin
 yPlayer-=speedPlayer;
 num:=1;
 repeat
 if gran[num].PtInside(xPLayer,yPlayer+objectPlayer.Height-10)=true then yPLayer+=speedPlayer;
 num+=1;
 until num=3;
 if interier[1].PtInside(xPLayer+objectPlayer.Width-12,yPlayer+objectPlayer.Height-15)=true then yPLayer+=speedPlayer;
 num:=2;
 repeat
 if interier[num].PtInside(xPLayer+objectPlayer.Width-12,yPlayer+objectPlayer.Height-10)=true then yPLayer+=speedPlayer;
 num+=1;
 until num=4;
 repeat
 if interier[num].PtInside(xPLayer,yPlayer+objectPlayer.Height-10)=true then yPLayer+=speedPlayer;
 num+=1;
 until num=7;
 Prozrachnost();
 end;
 if Home=True then
 begin
 if ((yPlayer-speedPlayer>130)and(xPlayer>255))or((xPlayer<=255)and(yPlayer>255)) then yPlayer:=yPlayer-speedPlayer;
 if interier[3].PtInside(xPlayer+objectPlayer.Width-10,yPlayer+objectPlayer.Height-12)=true then yPlayer:=yPlayer+speedPlayer;
 Prozrachnost();
 end;
 if Map=True then
 begin
 yPlayer:=yPlayer-speedPlayer;
 num:=1;
 repeat 
 if (gran[num].PtInside(xPlayer+objectPlayer.Width-10,yPlayer+objectPlayer.Height-10)=true)or(gran[num].PtInside(xPlayer+5,yPlayer+objectPlayer.Height-10)=true) then yPlayer:=yPlayer+speedPlayer;
 num:=num+1;
 until num=15;
 end;
 if Mart=true then
 begin
 yPlayer:=yPlayer-speedPlayer;
 num:=1;
 repeat
 if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(gran[num].PtInside(xPlayer+objectPlayer.Width-1,yPlayer+objectPlayer.Height-10)=true) then yPlayer:=yPlayer+speedPlayer;
 num:=num+1;
 until num=7;
 intr:=1;
  repeat
   if (interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(interier[intr].PtInside(xPlayer+objectPlayer.Width-1,yPlayer+objectPlayer.Height-10)=true) then yPlayer:=yPlayer+speedPlayer;
   intr:=intr+1;
  until intr=4;
 Prozrachnost();
 end;
 if Work=true then
 begin
 yPlayer:=yPlayer-speedPlayer;
 num:=1;
 repeat
 if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true) then yPlayer:=yPlayer+speedPlayer;
 num:=num+1;
 until num=7;
 intr:=1;
  repeat
   if (interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(interier[intr].PtInside(xPlayer+objectPlayer.Width-1,yPlayer+objectPlayer.Height-10)=true) then yPlayer:=yPlayer+speedPlayer;
   intr:=intr+1;
  until intr=6;
 Prozrachnost();
 end;
 if Funclub=true then
 begin
  yPlayer:=yPlayer-speedPlayer;
  if yPlayer+objectPlayer.Height<0 then yPlayer:=yPlayer+speedPlayer;
  num:=1;
  repeat
   if (gran[num].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(gran[num].PtInside(xPlayer+objectPlayer.Width-2,yPlayer+objectPlayer.Height-10)=true) then yPlayer:=yPlayer+speedPlayer;
   num:=num+1;
  until num=5;
  intr:=1;
  repeat
   if (interier[intr].PtInside(xPlayer,yPlayer+objectPlayer.Height-10)=true)or(interier[intr].PtInside(xPlayer+objectPlayer.Width-1,yPlayer+objectPlayer.Height-25)=true) then yPlayer:=yPlayer+speedPlayer;
   intr:=intr+1;
  until intr=4;
 Prozrachnost();
 end;
 navigation:=4;
 objectPlayer.MoveTo(xPlayer,yPlayer);
 Navigate();
 sleep(100);
 end;
//=================================================================================================================================================================
graphABC.OnKeyUp:=ishod; 
end;
end;


// конец объявления процедур
begin
GM:=true;
dr:=random(1,28);
mr:=random(1,12);
voz:=random(20,30);
year:=2016;
month:=random(1,12);
chislo:=random(1,28);
t1:=random(0,59);
t2:=random(1,23);
jitie:=0;
car:=0;
med:=0;
hp:=100;
gold:=50;
food:=10;
water:=10;
son:=100;
nastr:=50;
zarp:=5;
kar:=80;
r:=1;
schet:=0;
credit:=0;
mxPlayer:=374;
myPlayer:=110;
proza:=false;
intr:=1;
xPlayer := 400;
yPlayer := 300;
speedPlayer := 10;
spritePlayer:='заготовки по картинкам/Персонаж/Player1(2).png';
ObjectPlayer := PictureAbc.Create(xPlayer,yPlayer,spritePlayer);
ObjectPlayer.Scale(1.8);
winGame();
Dom();
Prozrachnost();
svitok:= PictureABC.Create(1000,0,'заготовки по картинкам/Игровая среда/книга.png');
navigation:=1;
hod:=2;
graphABC.OnKeyDown := Move;
//Обработка постоянного времени
//repeat
//sleep(1000);
//proverka+=1;
//writeLn(proverka)
//until nedostatok=true;
end.