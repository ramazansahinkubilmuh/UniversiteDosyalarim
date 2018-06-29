#include<stdio.h>
#include<stdlib.h>

int siralama(int,int);
int kontrol(int,int,int);

int main()
{
	int hafta_sayaci,yarismaci_sayaci,puan_sayaci,sifirlama_sayaci,tut_sayaci;
	int yarismaci_sayisi=0,hafta_sayisi=0;
	int yarismaci_no=0,karsilastirma=0;
	int tut[3]={0},birinci_olma_tut[10]={0};
	int koc_puan_tut[10]={0},seyirci_puan_tut[10]={0};
	char secim;
	char i_secim;
	char cikis='h';
	do
	{
		int genel_toplam[10]={0},koc_puan[10]={0},birinci_olma[10]={0},seyirci_puan[10]={0},yarismaci_puan[10]={0};
		do
		{
			
			system("CLS");
			printf("\n           ANA MENU\n\n");
			printf("    1. Yeni Yarisma Duzenleme\n");
			printf("    2. Son Duzenlenen Yarismanin Istatistiklerini Goruntuleme\n");
			printf("    3. Cikis\n\n");
			printf("    Seciminizi giriniz: ");
			scanf("%c",&secim);
		}while(secim!='1' && secim!='2' && secim!='3');//secim'in 1,2,3 degerlerinden farkli deger olmamasini sagliyoruz
		switch(secim)
		{
			case '1':
				system("CLS");
				printf("\n");
				do
				{
					printf("    Yarismaci Sayisini Girin : ");
					scanf("%d",&yarismaci_sayisi);
				}while(yarismaci_sayisi<5 || yarismaci_sayisi>10);//yarismaci sayisini 5 ile 10 arasinda girmesini sagliyoruz
				printf("\n");
				do
				{
					printf("    Yarisma Kac Hafta Surecek : ");
					scanf("%d", &hafta_sayisi);
				}while (hafta_sayisi < 3);//hafta sayisini 3 den buyuk bir deger girmesini sagliyoruz
				for(hafta_sayaci=0;hafta_sayaci<hafta_sayisi;hafta_sayaci++)//hafta sayisina gore donecek olan dongu
				{
					printf("------------------------------------------------------------------");
					printf("\n\n    %d. Hafta Puanlama\n------------------------------------------------------------------\n",hafta_sayaci+1);
					for(yarismaci_sayaci=0;yarismaci_sayaci<yarismaci_sayisi;yarismaci_sayaci++)//yarismaci sayisina gore donecek olan dongu
					{
						for(puan_sayaci=0;puan_sayaci<3;puan_sayaci++)//burada puan sayacini 3'e kadar kisitlamamizin sebebi sadece 1,2 ve 3 puanlar oldugu icin
						{
							do
							{
							do
							{
								printf("    %d. Kocun %d Puan Verdigi Yarismacinin Numarasi : ",yarismaci_sayaci+1,puan_sayaci+1);
								scanf("%d",&tut[puan_sayaci]);
								
								if (yarismaci_sayaci+1 == tut[puan_sayaci])//koc'un kendi yarismacisina puan vermesini engelliyoruz
								{
									printf("------------------------------------------------------------------\n");
									printf(" Kendi yarismaciniza oy veremezsiniz.\n");
									printf("------------------------------------------------------------------\n");
									
								}
								
								if(tut[puan_sayaci] > yarismaci_sayisi||tut[puan_sayaci]<1)//girilen yarismaci numarasini 1 ile yarismaci sayisi arasinda olmasini sagliyoruz
								{
									printf("------------------------------------------------------------------\n");
									printf(" 1 ile %d Arasinda Bir Deger Giriniz.\n",yarismaci_sayisi);
									printf("------------------------------------------------------------------\n");
									
								}

								if(tut[puan_sayaci]!=0)//burada eger girilen deger 0 ise kontrol yaptirmamasini sagladik								
									karsilastirma=kontrol(tut,puan_sayaci,yarismaci_sayisi);//ayni hafta icinde ayni yarismacilara puan verilip verilmedigini kontrol ettirdik
							
							}while (yarismaci_sayaci+1 == tut[puan_sayaci] || tut[puan_sayaci] < 1 || tut[puan_sayaci] > yarismaci_sayisi );//yanlis veri girisi yapildiysa tekrar sorgu yapmak icin kullanilan do-while 
							
							}while(karsilastirma==1);//karsilastirma icin kullandigimiz do-while sonu
							
							koc_puan[tut[puan_sayaci]-1]+=puan_sayaci+1;//girilen yarismaci numarasina koc'un verdigi puan ekleniyor
							yarismaci_puan[tut[puan_sayaci]-1]+=puan_sayaci+1;//siralamada kullanilacak olan degiskene puanlar ekleniyor
							genel_toplam[tut[puan_sayaci]-1]+=puan_sayaci+1;//toplam puan uzerine ekleme yapilarak hesaplaniyor

						}//puan_sayaci for bitis

						for(sifirlama_sayaci=0;sifirlama_sayaci<3;sifirlama_sayaci++)//kullanicidan aldigimiz yarismaci numarasini tutan degiskeni sifirliyoruz
						{
								tut[sifirlama_sayaci]=0;
						}

					}//yarismaci_sayaci for bitis

					for (puan_sayaci=0;puan_sayaci<3;puan_sayaci++)//burada puan sayacini 3'e kadar kisitlamamizin sebebi sadece 1,2 ve 3 puanlar oldugu icin
					{
						do
						{
						do
						{
						printf("    Seyircinin %d puan verdigi yarismacinin numarasini giriniz :",puan_sayaci+1);
						scanf("%d",&tut[puan_sayaci]);

						if (tut[puan_sayaci] < 1 || tut[puan_sayaci] > yarismaci_sayisi)//girilen yarismaci numarasini 1 ile yarismaci sayisi arasinda olmasini sagliyoruz
						{
							printf("------------------------------------------------------------------\n");
							printf(" 1 ile %d arasinda bir deger giriniz.\n",yarismaci_sayisi);
							printf("------------------------------------------------------------------\n");
						}

						if(tut[puan_sayaci]!=0)//burada eger girilen deger 0 ise kontrol yaptirmamasini sagladik
							karsilastirma=kontrol(tut,puan_sayaci,yarismaci_sayaci);//ayni hafta icinde ayni yarismacilara puan verilip verilmedigini kontrol ettirdik
						
						}while (tut[puan_sayaci] < 1 || tut[puan_sayaci] > yarismaci_sayisi);//yanlis veri girisi yapildiysa tekrar sorgu yapmak icin kullanilan do-while 
						
						}while(karsilastirma==1);//karsilastirma icin kullandigimiz do-while sonu
						seyirci_puan[tut[puan_sayaci]-1]+=(yarismaci_sayisi-1)*(puan_sayaci+1);//girilen yarismaci numarasina seyircilerin verdigi puan ekleniyor
						yarismaci_puan[tut[puan_sayaci]-1]+=(yarismaci_sayisi-1)*(puan_sayaci+1);//siralamada kullanilacak olan degiskene puanlar ekleniyor
						genel_toplam[tut[puan_sayaci]-1]+=(yarismaci_sayisi-1)*(puan_sayaci+1);//toplam puan uzerine ekleme yapilarak hesaplaniyor
					}
					printf("\n\n    %d. Haftanin Sonuclari\n------------------------------------------------------------------\n    Yarismaci No   Puan\n------------------------------------------------------------------\n",hafta_sayaci+1);
		
					yarismaci_no=siralama(yarismaci_puan,yarismaci_sayisi);//siralama fonksiyonu cagriliyor ve yarismaci_no degiskenine gelen deger aktariliyor
					birinci_olma[yarismaci_no]++;//birinci olan yarismaciyi arttiriyoruz
		
					printf("\n\n    %d. Haftanin Sonunda Genel Sonuclari\n------------------------------------------------------------------\n    Yarismaci No   Puan\n------------------------------------------------------------------\n",hafta_sayaci+1);
		
					siralama(genel_toplam,yarismaci_sayisi);//siralama fonksiyonu cagriliyor

					for(tut_sayaci=0;tut_sayaci<yarismaci_sayisi;tut_sayaci++)//ram'da tutulacak olan degiskenlere aktarma islemi yapiyoruz
					{
						seyirci_puan_tut[tut_sayaci]=seyirci_puan[tut_sayaci];
						koc_puan_tut[tut_sayaci]=koc_puan[tut_sayaci];		
						birinci_olma_tut[tut_sayaci]=birinci_olma[tut_sayaci];
					}

					for(sifirlama_sayaci=0;sifirlama_sayaci<3;sifirlama_sayaci++)//sifirlama islemi yapiyoruz	
						tut[sifirlama_sayaci]=0;

					for(sifirlama_sayaci=0;sifirlama_sayaci<yarismaci_sayisi;sifirlama_sayaci++)//sifirlama islemi yapiyoruz
						yarismaci_puan[sifirlama_sayaci]=0;//sifirlamak icin yazdik

				}//hafta_sayaci for bitis
				printf("\n\n------------------------------------------------------------------\n");
				printf("\    Istatistik Menuye Donmek Icin Bir Tusa Basin...\n");
				printf("------------------------------------------------------------------\n");
				getch();//bir tusa basana kadar bekletme islemini yaptiriyoruz
				printf("\n\n");

				//case 1 sonu

			case '2'://istatistik menusunu goruntuluyor
				do
					{	
						do
							{
								system("CLS");//ekrani temizliyor
								printf("\n           ISTATISTIK ALT MENUSU\n\n");
								printf("1.Sadece koclarin puanlamasi dikkate alindiginda genel durumun listelenmesi\n");
								printf("2.Sadece seyircilerin puanlamasi dikkate alindiginda genel durumun listelenmesi\n");
								printf("3.Yarismacilarin birinci olarak tamamladiklari hafta sayilarinin listelenmesi\n");
								printf("4.Ana Menu\n\n");
								printf("    Seciminizi giriniz: ");	
								fflush(stdin);//tampon bellegi temizliyor
								scanf("%c",&i_secim);
							}while(i_secim!='1' && i_secim!='2' && i_secim!='3'&&i_secim!='4');//1,2,3 ve 4 disinda karakter girilmesini engelliyoruz

					

						switch(i_secim)
						{
							case '1':
								system("CLS");
								printf("    Sadece koclarin puanlamasina gore genel durum\n------------------------------------------------------------------\n    Yarismaci No   Puan\n------------------------------------------------------------------\n");
								siralama(koc_puan_tut,yarismaci_sayisi);//siralama fonksiyonuna koclarin puanina gore hesaplamasini belirtiyoruz
								break;
							case '2':
								system("CLS");
								printf("    Sadece seyircilerin puanlamasina gore genel durum\n------------------------------------------------------------------\n    Yarismaci No   Puan\n------------------------------------------------------------------\n");
								siralama(seyirci_puan_tut,yarismaci_sayisi);//siralama fonksiyonuna seyircilerin puanina gore hesaplamasini belirtiyoruz
								break;
							case '3':
								system("CLS");
								printf("    Yarismacilarin 1. olarak tamamladiklari hafta sayisi\n------------------------------------------------------------------\n    Yarismaci No  Hafta Sayisi\n------------------------------------------------------------------\n");
								siralama(birinci_olma_tut,yarismaci_sayisi);//siralam fonksiyonuna birinci olma sayisina gore hesaplamasini belirtiyoruz
								break;
							case '4':
								break;

						}//i_secim switch sonu
						if(i_secim!='4')//eger i_secim 4 degilse blok icindeki islemi yapmasini sagliyoruz
						{
							printf("\n\n------------------------------------------------------------------\n");
							printf("    Istatistik Menuye Donmek Icin Bir Tusa Basin...");
							printf("\n------------------------------------------------------------------\n");
							getch();
						}
					}while(i_secim!='4');//istatistik menusune donmesi icin kullandigimiz do-while sonu

				
				break;//case 2 sonu



					case '3':
						printf("\n\n");
						do
						{
							printf("------------------------------------------------------------------\n");
							printf("    Cikmak Istediginize Emin Misiniz (E/e,H/h) : ");
							fflush(stdin);//tampon bellegi temizliyoruz
							scanf("%c",&cikis);
							
						}while(cikis!='e'&&cikis!='E'&&cikis!='h'&&cikis!='H');//yanlis girisi engelliyoruz
						break;//case 3 sonu
		}//switch(secim) sonu
	}while(cikis=='h' || cikis=='H');//cikis do-while sonu

}

int kontrol(int karsilastirma_dizisi[],int dizi_sayaci,int yarismaci_sayisi)
{
	int sayac,karsilastirma=0;
	for(sayac=0;sayac<yarismaci_sayisi;sayac++)
	{
		if(sayac!=dizi_sayaci)//sadece puan_sayacinin indis degerlerinin esit olmadigi durumlari karsilastirmasi icin kullandik
		{
			if(karsilastirma_dizisi[dizi_sayaci]==karsilastirma_dizisi[sayac])//girilen yarismaci numaralari birbirine esit mi degilmi karsilastirma yapiyoruz
			{
				printf("------------------------------------------------------------------\n");
				printf(" Yarismaciyi Bir Hafta Icinde Bir Defa Oylayabilirsiniz...\n");
				printf("------------------------------------------------------------------\n");
				karsilastirma=1;
				break;
			}
		}
	}
	return karsilastirma;//karsilastirma icindeki degeri donderiyoruz
}

int siralama(int puan_dizisi[],int yarismaci_sayisi)
{
	int i,j;//sayac degiskenlerimiz
	int sirala_yarismaci_no[10],gecici_puan[10],gecici_no,temp;//gecici olarak kullandigimiz degiskenlerimiz
	for(i=0;i<yarismaci_sayisi;i++)//ana fonksiyondan gelen degerleri gecici degiskenlere aktarma islemi yapiyoruz
	{
		gecici_puan[i]=puan_dizisi[i];
		sirala_yarismaci_no[i]=i;
	}

	/*asagida siralama islemlerini yapiyoruz*/

	for(i=0;i<yarismaci_sayisi;i++)
	{
		for(j=0;j<yarismaci_sayisi;j++)
		{
			if(gecici_puan[j]<gecici_puan[j+1])//bir sonraki dizi buyuk ise yer degisikligi yaparak siraliyoruz
			{
				temp=gecici_puan[j+1];//buyuk olan puan dizisini gecici olarak tutuyoruz
                gecici_puan[j+1]=gecici_puan[j];//buyuk olan puan dizisini kucuk olan puan dizisiyle yer degisikligi yaptiriyoruz
                gecici_puan[j]=temp;//tuttugumuz buyuk puan dizisini tekrar aktarma islemi yapiyoruz

				/* asagida yukarida yaptigimiz islemlerin sadece numara degerlerinin yerlerini degistirme islemi yapiyoruz */

                gecici_no=sirala_yarismaci_no[j+1];
                sirala_yarismaci_no[j+1]=sirala_yarismaci_no[j];
                sirala_yarismaci_no[j]=gecici_no;
			}
		}
	}

	/*asagida yazdirma islemini yapiyoruz*/

	for(i=0;i<yarismaci_sayisi;i++)
	{
		printf("%6d %15d\n",sirala_yarismaci_no[i]+1,gecici_puan[i]);// %6d 6 karakterlik alan olusturarak sagdan baslayarak yazdirma islemi yapiyor
	}

	return sirala_yarismaci_no[0];// burada haftanin birinci olan yarismaci numarasini donderiyoruz
}







