#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <math.h>

int menu_1();
int menu_2();
int menu_3();

/* menu_1 icinde kullanilan fonksiyonlarin protatipleri */
void numaradan_ara(char *);
void isimden_ara();
void tum_bilgiler();
void abone_gorusmeler();
void gune_gore_gorusmeler();
void aylik_gorusme();

/* menu_2 icinde kullanilan fonksiyonlarin protatipleri */
void abone_ekle();
void adres_guncelle();
void gorusme();

char emin='e';
char ana_cikis='h';

int main()
{
	do
	{
			int ana_secim;
			while(ana_cikis=='h'||ana_cikis=='H')
			{
				system("cls");
				printf("1.Sorgulama Programi\n");
				printf("2.Guncelleme Programi\n");
				printf("3.Kontor Yukleme Programi\n");
				printf("4.Cikis\n\n");
				printf("Seciminizi Girin : ");
				fflush(stdin);
				scanf("%d",&ana_secim);
				switch(ana_secim)
				{
					case 1:
						menu_1();
						break;
					case 2:
						menu_2();
						break;
					case 3:
						menu_3();
						break;
					case 4:
						printf("\nCikmak istediginize emin misiniz?(E/H) : ");
						fflush(stdin);
						scanf("%c",&ana_cikis);
						break;
				}
			}

	}while(emin=='h' || emin=='H');
}

int menu_1()
{
		int secim=0;
		char aranan_telefon_numarasi[8];
		do
		{
			do
			{
				do
				{
						system("cls");
						printf("\nSorgulama Programi\n");
						printf("\n1-Telefon numarasi ile abonenin bilgileri sorgulama\n");
						printf("2-Telefon numarasi ile bir abonenin bilgileri ve o ay yapmis oldugu gorusmeleri\n");
						printf("3-Ad soyad ile abonelerin bilgileri sorgulama\n");
						printf("4-Tum abonelerin bilgileri\n");
						printf("5-Bir gunde yapilan gorusmelerin listelenmesi\n");
						printf("6-Tum abonelerin o ay yapmis olduklari gorusme toplamlari\n");
						printf("7-Cikis\n");
				
						printf("\nSecim: ");
						scanf("%d",&secim);
				}while(secim<0 || secim>7);
				switch (secim)
				{
					case 1:
					{
						system("cls");
						printf("Aranan telefon numarasi : ");
						scanf("%s",aranan_telefon_numarasi);
						numaradan_ara(aranan_telefon_numarasi);
						getch();
						break;
					}
					case 2:
					{
						system("cls");
						abone_gorusmeler();
						getch();
						break;
					}
					case 3:
					{
						system("cls");
						isimden_ara();
						getch();
						break;
					}
					case 4:
					{
						system("cls");
						tum_bilgiler();
						getch();
						break;
					}
					case 5:
					{
						system("cls");
						gune_gore_gorusmeler();
						getch();
						break;
					}
					case 6:
					{
						system("cls");
						aylik_gorusme();
						getch();
						break;
					}
					case 7:
					{
						printf("\nCikmak istediginize emin misiniz?(E/H) : ");
						fflush(stdin);
						scanf("%c",&emin);
						break;
					}
					break;
				}//switch sonu
				
			}while(emin=='h' || emin=='H');
		}while(secim!=7);
		return ;
    
}//menu_1 sonu

int menu_2()
{
	int secim=0;
    do
	{
		do
		{
		    do
			{
				system("cls");
				printf("\nGuncelleme Programi\n");
				printf("1. Yeni bir abonenin eklenmesi\n");
				printf("2. Bir abonenin adres bilgisinin guncellenmesi\n");
				printf("3. Gorusme dosyasinin sonuna yapilan gorusmelere iliskin kayitlarin eklenmesi\n");
				printf("4. Cikis\n");
 
				printf("Secim: ");
				scanf("%d",&secim);
			}while(secim<1 || secim>4);
			switch (secim)
			{
				case 1:
				{
					system("cls");
					abone_ekle();
					getch();
					break;
				}
				case 2:
				{
					system("cls");
					adres_guncelle();
					getch();
					break;
				}
				case 3:
				{
					system("cls");
					gorusme();
					getch();
					break;
				}
				case 4:
				{
					printf("\nCikmak istediginize emin misiniz? : ");
					fflush(stdin);
					scanf("%c",&emin);
					break;
				}
			}//switch sonu
		}while(emin=='h' || emin=='H');
    }while(secim!=4);
    return ;
}

int menu_3()
{
	FILE *dosya_ac;
    FILE *dosya_ac2;
    FILE *dosya_ac3;
    char telefon_numarasi[8];
    char isim_soyisim[26];
    char adres[31];
    int abone_tipleri;
    int kontor;
    char tel[8];
	system("cls");
	printf("\nKontor Yukleme Programi\n");
    if((dosya_ac = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        if((dosya_ac2 = fopen("kontor_yukleme.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
        else
        {
            dosya_ac3 = fopen("gecici.txt","w");
 
            while(!feof(dosya_ac)){
                fgets(telefon_numarasi,8,dosya_ac);
                fgets(isim_soyisim,25,dosya_ac);
                fgets(adres,30,dosya_ac);
                fscanf(dosya_ac,"%d",&abone_tipleri);
                fscanf(dosya_ac,"%d\n",&kontor);
                fscanf(dosya_ac2,"%s%d",tel,&kontor);
                while(!feof(dosya_ac2)){
 
                    if(strncmp(tel,telefon_numarasi,strlen(tel))==0)
                    {
                        kontor+=kontor;
                    }
                    fscanf(dosya_ac2,"%s%d",tel,&kontor);
                }
                rewind(dosya_ac2);
 
                fprintf(dosya_ac3,"%-7s%-24s%-31s%-2d%d\n",telefon_numarasi,isim_soyisim,adres,abone_tipleri,kontor);
            }
            printf("Kontor guncellemeleri yapilmistir!\n");
            remove("abone.txt");
            rename("gecici.txt","abone.txt");
            fclose(dosya_ac3);
        }
        fclose(dosya_ac2);
    }
    fclose(dosya_ac);
	emin='e';
	getch();
	return ;
}


/* menu_1 icin kullanilan fonksiyonlar */

void numaradan_ara(char *aranan_telefon_numarasi) 
{                               
    int bulundu=0;
	int tip[4]={0};
    char abone_tipi[9];
    char telefon_numarasi[8];
    char isim_soyisim[26];
    char adres[31];
    int abone_tipleri;
    int kontor;
 
    FILE *dosya_ac;
 
    if((dosya_ac = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        while(!feof(dosya_ac))
        {
            fgets(telefon_numarasi,8,dosya_ac);
 
            if(strncmp(aranan_telefon_numarasi, telefon_numarasi, strlen(aranan_telefon_numarasi)+1)==0)
            {
                fgets(isim_soyisim,25,dosya_ac);
                fgets(adres,30,dosya_ac);
                fscanf(dosya_ac,"%d",&abone_tipleri);
                fscanf(dosya_ac,"%d",&kontor);
                switch (abone_tipleri){
                case 1: {
                    tip[0]++; 
                    sprintf(abone_tipi,"Sahis"); 
                    break;}
                case 2: {
                    tip[1]++;
                    sprintf(abone_tipi,"Isyeri");
                    break;}
                case 3: {
                    tip[2]++;
                    sprintf(abone_tipi,"Kamu");
                    break;}
                case 4: {
                    tip[3]++;
                    sprintf(abone_tipi,"Guvenlik");
                    break;}
                break;}
 
                printf("%-10s%-25s%-30s%-8s%-s\n","Tel no","Ad Soyad","Adres","Tip","Kontor");
                printf("%-10s%-25s%-30s%-8s%-s\n","______","________","_____","____","______");
                printf("%-10s%-20s%-30s%-10s%d\n",telefon_numarasi,isim_soyisim,adres,abone_tipi,kontor);
                bulundu=1;
                break;
            }
            
 
        }
        if (bulundu==0) printf("Girilen telefon numarasina ait bir abone bulunmamaktadir!\n");
    }
    fclose(dosya_ac);
    return;
}
 
void isimden_ara()
{
 
    char aranan_isim[25];
    int bulundu=0,j;
    char telefon_numarasi[8];
    char isim_soyisim[26];
    char adres[31];
    int abone_tipleri;
    int kontor;
    char abone_tipi[9];
    int tip[4]={0};
 
    FILE *dosya;
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Abonenin adini ve soyadini giriniz: ");
        scanf("%s",aranan_isim);
 
        j=strlen(aranan_isim);
        aranan_isim[j]=' ';
        scanf("%s",aranan_isim+j+1);
 
        fgets(telefon_numarasi,8,dosya);
        fgets(isim_soyisim,26,dosya);
        fgets(adres,31,dosya);
        fscanf(dosya,"%d",&abone_tipleri);
        fscanf(dosya,"%d\n",&kontor);
 
        printf("%-10s%-25s%-30s%-8s%-s\n","Tel no","Ad Soyad","Adres","Tip","Kontor");
        printf("%-10s%-25s%-30s%-8s%-s\n","______","________","_____","____","______");
 
        while(!feof(dosya))
        {
 
            if(strncmp(aranan_isim, isim_soyisim, strlen(aranan_isim))==0){
                switch (abone_tipleri){
            case 1: {
                    tip[0]++;
                    sprintf(abone_tipi,"Sahis");
            break;}
            case 2: {tip[1]++;
                    sprintf(abone_tipi,"Isyeri");
                    break;}
            case 3: {
                tip[2]++;
                sprintf(abone_tipi,"Kamu");
                break;}
            case 4: {
                tip[3]++;
                sprintf(abone_tipi,"Guvenlik");
                break;}
            break;}
 
            printf("%-10s%-20s%-30s%-10s%d\n",telefon_numarasi,isim_soyisim,adres,abone_tipi,kontor);
            bulundu=1;
            }
 
            fgets(telefon_numarasi,8,dosya);
            fgets(isim_soyisim,26,dosya);
            fgets(adres,31,dosya);
            fscanf(dosya,"%d",&abone_tipleri);
            fscanf(dosya,"%d\n",&kontor);
 
        }
 
       }
 
       if (bulundu==0) printf("Girilen ad soyada sahip bir abone yok!\n");
 
    fclose(dosya);
    return;
 
}
 
void tum_bilgiler()
{
 
    FILE *dosya;
    char telefon_numarasi[8];
    char isim_soyisim[26];
    char adres[31];
    int abone_tipleri;
    int kontor;
    int tip[4]={0};
    char abone_tipi[9];
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
 
        printf("%-10s%-25s%-30s%-8s%-s\n","Tel no","Ad Soyad","Adres","Tip","Kontor");
        printf("%-10s%-25s%-30s%-8s%-s\n","______","________","_____","____","______");
 
        while(!feof(dosya)){
 
            fgets(telefon_numarasi,8,dosya);
            fgets(isim_soyisim,26,dosya);
            fgets(adres,31,dosya);
            fscanf(dosya,"%d",&abone_tipleri);
            fscanf(dosya,"%d\n",&kontor);
 
            switch (abone_tipleri){
            case 1: {
                    tip[0]++;
                    sprintf(abone_tipi,"Sahis");
            break;}
            case 2: {tip[1]++;
                    sprintf(abone_tipi,"Isyeri");
                    break;}
            case 3: {
                tip[2]++;
                sprintf(abone_tipi,"Kamu");
                break;}
            case 4: {
                tip[3]++;
                sprintf(abone_tipi,"Guvenlik");
                break;}
            break;}
 
            printf("%-10s%-20s%-30s%-10s%d\n",telefon_numarasi,isim_soyisim,adres,abone_tipi,kontor);
 
    }
            printf("\n%-20s%-20s\n","Abone Tipi","Abone Sayisi");
            printf("%-20s%-20s\n","__________","____________");
            printf("%-20s%5d\n%-20s%5d\n%-20s%5d\n%-20s%5d\n","Sahis",tip[0],"Isyeri",tip[1],"Kamu",tip[2],"Guvenlik",tip[3]);
 
    }
 
    fclose(dosya);
 
    return;
}
 
void abone_gorusmeler()
{
 
    FILE *dosya_ac;
    char aranan_telefon_numarasi[8];
    char arayan_numara[8];
    char aranan_numara[11];
    int tarih;
    int baslangic_saati=0;
    int baslangic_dakikasi=0;
    int bitis_saati=0;
	int bitis_dakikasi=0;
	int gecici_dakika=0;
	int gecici_saat=0;
    int toplam_konusma_suresi=0,bulundu=0,gorusme_sayisi=0;
 
    if((dosya_ac = fopen("gorusme.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Telefon no: ");
        scanf("%s",aranan_telefon_numarasi);
        numaradan_ara(aranan_telefon_numarasi);
        printf("\n\nGorusmeler:\n%-20s%-10s%-10s%10s\n","Aranan Telefon ","Gun","Baslangic","Bitis");
        printf("%-20s%-10s%-10s%10s\n","_____________","_______","_________","_______");
 
    while(!feof(dosya_ac))
        {
            fgets(arayan_numara,8,dosya_ac);
 
            if(strncmp(aranan_telefon_numarasi, arayan_numara, strlen(aranan_telefon_numarasi)+1)==0)
            {
                fgets(aranan_numara,11,dosya_ac);
                fscanf(dosya_ac,"%d",&tarih);
                fscanf(dosya_ac,"%d",&baslangic_saati);
                fscanf(dosya_ac,"%d",&baslangic_dakikasi);
				fscanf(dosya_ac,"%d",&bitis_saati);
                fscanf(dosya_ac,"%d",&bitis_dakikasi);
                
				gorusme_sayisi++;
				
				
				if(baslangic_saati>bitis_saati)
				{
					gecici_saat=bitis_saati+24;
					toplam_konusma_suresi+=(gecici_saat-baslangic_saati)*60;
				}
				else
					toplam_konusma_suresi+=(baslangic_saati-bitis_saati)*60;
				if(baslangic_dakikasi>bitis_dakikasi)
				{
					gecici_dakika=bitis_dakikasi+60;
					toplam_konusma_suresi+=(gecici_dakika-baslangic_dakikasi);
				}
				else
					toplam_konusma_suresi+=bitis_dakikasi-baslangic_dakikasi;
                if(bitis_dakikasi>=60)
				{
                    bitis_saati+=bitis_dakikasi/60;
                    bitis_dakikasi=bitis_dakikasi%60; 
                }
				
 
                printf("%-20s%-10d%d:%-10d%d : %d\n",aranan_numara,tarih,baslangic_saati,baslangic_dakikasi,bitis_saati,bitis_dakikasi);
                bulundu=1;
 
            }
 
        }
        if (bulundu==0) printf("\n\n!Girilen telefon numarasina ait gorusme kaydi yok!\n");
    }
                printf("\nToplam konusma suresi:%d dk\n",toplam_konusma_suresi);
                printf("Toplam gorusme sayisi:%d\n",gorusme_sayisi);
    fclose(dosya_ac);

}
 
void gune_gore_gorusmeler()
{
 
    FILE *dosya_ac;
    char arayan_numara[8];
    char aranan_numara[11];
    int tarih;
    int baslangic_saati=0;
    int baslangic_dakikasi=0;
    int bitis_saati=0;
	int bitis_dakikasi=0;
	int gecici_saat=0;
	int gecici_dakika=0;
    int toplam_konusma_suresi=0,bulundu=0,gorusme_sayisi=0,aranan_gun;
 
    if((dosya_ac = fopen("gorusme.txt","r")) == NULL)
        printf("dosya_ac acilamadi!\n");
    else
    {
        printf("Gunu giriniz:\n");
        scanf("%d",&aranan_gun);
        printf("\n\nGorusmeler:\n%-20s%-20s%-13s%-15s\n","Arayan Tel No","Aranan Tel no","Baslangic","Sure");
        printf("%-20s%-20s%-13s%-15s\n",                 "______________","_____________","_________","____");
  
        while(!feof(dosya_ac))
		{
 
            fgets(arayan_numara,8,dosya_ac);
            fgets(aranan_numara,11,dosya_ac);
            fscanf(dosya_ac,"%d",&tarih);
            fscanf(dosya_ac,"%d",&baslangic_saati);
            fscanf(dosya_ac,"%d",&baslangic_dakikasi);
			fscanf(dosya_ac,"%d",&bitis_saati);
            fscanf(dosya_ac,"%d\n",&bitis_dakikasi);
 
            if(tarih==aranan_gun)
			{
                gorusme_sayisi++;
                if(baslangic_saati>bitis_saati)
				{
					gecici_saat=bitis_saati+24;
					toplam_konusma_suresi+=(gecici_saat-baslangic_saati)*60;
				}
				else
					toplam_konusma_suresi+=(baslangic_saati-bitis_saati)*60;
				if(baslangic_dakikasi>bitis_dakikasi){
					gecici_dakika=bitis_dakikasi;
					toplam_konusma_suresi+=(gecici_dakika-baslangic_dakikasi);
				}
				else
					toplam_konusma_suresi+=bitis_dakikasi-baslangic_dakikasi;
                printf("%-20s%-20s%d:%-12d%d:%d\n",arayan_numara,aranan_numara,baslangic_saati,baslangic_dakikasi,bitis_saati,bitis_dakikasi);
                bulundu=1;
            }
        }
 
    if (bulundu==0) printf("\n\nGirilen gune ait gorusme kaydi yok!\n");
    printf("\nToplam sure:%d dk\n",toplam_konusma_suresi);
    printf("Toplam gorusme sayisi:%d\n",gorusme_sayisi);
    }
    fclose(dosya_ac);

}
 
void aylik_gorusme()
{
 
	FILE *dosya_ac;
    FILE *dosya2_ac;
 
    char telefon_numarasi[8];
    char isim_soyisim[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    char arayan_numara[8];
    char aranan_numara[11];
    int tarih;
    int baslangic_saati=0;
    int baslangic_dakikasi=0;
	int bitis_saati=0,toplam_konusma_saati=0;
    int bitis_dakikasi=0,toplam_konusma_dakikasi=0;
    int gorusme_sayisi=0;
 
    if((dosya_ac = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        if((dosya2_ac = fopen("gorusme.txt","r")) == NULL)
            printf("Dosya acilamadi!\n");
        else
        {
            printf("%-10s%-20s%-20s%-5s\n","Tel no","Ad Soyad","Top Gorusme Say","Sure");
            printf("%-10s%-20s%-20s%-5s\n","______","________","________________","_____");

            while(!feof(dosya_ac)){
                fgets(telefon_numarasi,8,dosya_ac);
                fgets(isim_soyisim,25,dosya_ac);
                fgets(adres,30,dosya_ac);
                fscanf(dosya_ac,"%d",&abone_tipi);
                fscanf(dosya_ac,"%d\n",&kontor);
 
                while(!feof(dosya2_ac))
				{
                    fgets(arayan_numara,8,dosya2_ac);
                    fgets(aranan_numara,11,dosya2_ac);
                    fscanf(dosya2_ac,"%d",&tarih);
                    fscanf(dosya2_ac,"%d",&baslangic_saati);
                    fscanf(dosya2_ac,"%d",&baslangic_dakikasi);
                    fscanf(dosya2_ac,"%d",&bitis_saati);
					fscanf(dosya2_ac,"%d\n",&bitis_dakikasi);
                    if(strncmp(arayan_numara,telefon_numarasi,strlen(arayan_numara))==0)
                    {
                        gorusme_sayisi++;
						toplam_konusma_saati+=bitis_saati;
						toplam_konusma_dakikasi+=bitis_dakikasi;
                    }
 					if(toplam_konusma_dakikasi>=60)
					{
						toplam_konusma_saati+=bitis_dakikasi/60;
						toplam_konusma_dakikasi=bitis_dakikasi%60;
					}
                }
                rewind(dosya2_ac);
 
                printf("%-10s%-28s%-13d%-2d:%-2d\n",telefon_numarasi,isim_soyisim,gorusme_sayisi,toplam_konusma_saati,toplam_konusma_dakikasi);
 
                gorusme_sayisi=0;
				toplam_konusma_saati=0;
				toplam_konusma_dakikasi=0;
 
            }
 
        }
        fclose(dosya2_ac);
    }
    fclose(dosya_ac);
}


/* menu_2 icin kullanilan fonksiyonlar */
void abone_ekle()
{
 
    FILE *dosya_ac;
    FILE *dosya_ac2;
    char telefon_numarasi[8];
    char isim_soyisim[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    int bulundu=0,yazildi=0;
    char abone[70],bos;
 
    if((dosya_ac = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Telefon no yu giriniz:\n");
        scanf("%s",telefon_numarasi);
        fgets(abone,69,dosya_ac);
        while(!feof(dosya_ac))
        {
 
            if(strncmp(telefon_numarasi, abone, strlen(telefon_numarasi))==0)
            {
               printf("Zaten bu telefon numarasina ait bir kullanici var!\n");
               bulundu=1;
               break;
            }
            fgets(abone,69,dosya_ac);
 
        }
        rewind(dosya_ac);
 
        if(bulundu==0){
            printf("Abonenin adini ve soyadini giriniz:\n");
            scanf("%c",&bos);
            gets(isim_soyisim);
            printf("Abonenin adresini giriniz:\n");
            gets(adres);
            printf("Abone tipini giriniz:\n");
            scanf("%d",&abone_tipi);
            printf("Abonenin kontor miktarini giriniz:\n");
            scanf("%d",&kontor);
 
            dosya_ac2 = fopen("abone.txt","a");
            fgets(abone,69,dosya_ac);
            fprintf(dosya_ac2,"%s%-25s%-30s%-2d%d\n",telefon_numarasi,isim_soyisim,adres,abone_tipi,kontor);
            
			fclose(dosya_ac2); 
    }
}
fclose(dosya_ac);
}
 
void adres_guncelle()
{
 
    FILE *dosya_ac;
    FILE *dosya_ac2;
    int bulundu=0,bos;
    char abone[70];
    char yeni_adres[26],telefon_numarasi[9];
 
    if((dosya_ac = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Telefon numarasini giriniz: "),
        scanf("%s",telefon_numarasi);
        while(!feof(dosya_ac))
        {
            fgets(abone,69,dosya_ac);
            if(strncmp(telefon_numarasi, abone, strlen(telefon_numarasi))==0)
            {
              bulundu=1;
              break;
            }
            else if(strncmp(telefon_numarasi, abone, strlen(telefon_numarasi))<0) break;
        }
        if(bulundu==0)
            printf("\nBu telefon numarasina ait kayit bulunamadi!\n");
        else
		{
            rewind(dosya_ac);
            dosya_ac2 = fopen("gecici.txt","w");
 
            printf("Yeni adresi giriniz: ");
            scanf("%d",&bos);
            gets(yeni_adres);
            fgets(abone,69,dosya_ac);
            while(!feof(dosya_ac))
            {
                if(strncmp(telefon_numarasi, abone, strlen(telefon_numarasi))==0)
                {
                    fwrite(abone,32,1,dosya_ac2); 
                    fprintf(dosya_ac2,"%-30s",yeni_adres); 
                    fputs(abone+62,dosya_ac2); 
                }
                else
                    fputs(abone,dosya_ac2);
 
                fgets(abone,69,dosya_ac);
            } 
			
			fclose(dosya_ac2);
        }	
		fclose(dosya_ac);
		remove("abone.txt");
		rename("gecici.txt","abone.txt");
    }
 
}
 
void gorusme()
{
 
    FILE *dosya_ac;
    FILE *dosya_ac2;
    char arayan_numara[8];
    char aranan_numara[11];
    int tarih;
    int baslangic_saati;
    int baslangic_dakikasi;
    int konusma_saati,konusma_dakikasi;
    int bulundu=0;
    char secim;
    char kayit[71];
    char telefon[8];
 
    do{
    if((dosya_ac = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
		system("cls");
        printf("Telefon numarasini giriniz: "),
        scanf("%s",arayan_numara);
        fgets(telefon,8,dosya_ac);
 
        while(!feof(dosya_ac))
        {
            if(strncmp(telefon,arayan_numara, strlen(arayan_numara))==0)
            {
              bulundu=1;
              break;
            }
            
 
            fgets(telefon,8,dosya_ac);
        }
        fclose(dosya_ac);
        if(bulundu==0)
            printf("\nBu telefon numarasina ait kayit bulunamadi!\n");
        else{
            if((dosya_ac = fopen("gorusme.txt","r")) == NULL)
                printf("Dosya acilamadi!\n");
            else{
                printf("Aranan numarayi giriniz: ");
                scanf("%s",aranan_numara);
                printf("Gorusme gununu giriniz: ");
                scanf("%d",&tarih);
                printf("Baslangic saatini giriniz: ");
                scanf("%d",&baslangic_saati);
                printf("Baslangic dakikasini giriniz: ");
                scanf("%d",&baslangic_dakikasi);
                printf("Konusma konusma saatini giriniz: ");
                scanf("%d",&konusma_saati);
				printf("Konusma konusma dakikasini giriniz: ");
                scanf("%d",&konusma_dakikasi);
 
                dosya_ac2 = fopen("gecici.txt","w");
                fgets(kayit,69,dosya_ac);
                printf("%s",kayit);
 
                while(!feof(dosya_ac))
                {
                    fputs(kayit,dosya_ac2);
                    fgets(kayit,69,dosya_ac);
                }
                fprintf(dosya_ac2,"%s%s %d %d %d %d %d",arayan_numara,aranan_numara,tarih,baslangic_saati,baslangic_dakikasi,konusma_saati,konusma_dakikasi); 
				
                fclose(dosya_ac2);
            }
            fclose(dosya_ac);
        }
		remove("gorusme.txt");
        rename("gecici.txt","gorusme.txt");
 
    }
    printf("\nIslemi tekrar yapmak istermisiniz?(E/H) : ");
    fflush(stdin);
    scanf("%c",&secim);
 
    }while(secim=='E' || secim=='e');

}
