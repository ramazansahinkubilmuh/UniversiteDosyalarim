#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void telefonla_ara(char *aranantel)
{
    char telefonno[8];
    char abone_adi[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    int bulundu=0;
    char abone_tipi2[9];
    FILE *dosya;
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        while(!feof(dosya))
        {
            fgets(telefonno,8,dosya);
 
            if(strncmp(aranantel, telefonno, strlen(aranantel)+1)==0)
            {
                fgets(abone_adi,25,dosya);
                fgets(adres,30,dosya);
                fscanf(dosya,"%d",&abone_tipi);
                fscanf(dosya,"%d",&kontor);
                switch (abone_tipi){
                case 1: {
                    sprintf(abone_tipi2,"Sahis");
                    break;}
                case 2: {
                    sprintf(abone_tipi2,"Isyeri");
                    break;}
                case 3: {
                    sprintf(abone_tipi2,"Kamu");
                    break;}
                case 4: {
                    sprintf(abone_tipi2,"Guvenlik");
                    break;}
                break;}
 
                printf("%-10s%-25s%-30s%-8s%-s\n","Tel no","Ad Soyad","Adres","Tip","Kontor");
                printf("%-10s%-25s%-30s%-8s%-s\n","______","________","_____","____","______");
                printf("%-10s%-20s%-30s%-10s%d\n",telefonno,abone_adi,adres,abone_tipi2,kontor);
                bulundu=1;
                break;
            }
 
        }
        if (bulundu==0)
			printf("Girilen telefon numarasina sahip bir abone yok!\n");
    }

    fclose(dosya);
    return;
}

void abone_gorusmeler(){
 
    FILE *fptr;
    char arayan_telno[8];
    char aranan_telno[11];
    int tarih;
    int baslangic_saati;
    int baslangic_dakikasi;
    int saat,gecici_saat=0;
	int dakika,gecici_dakika=0;
    char aranan_telno2[8];
    int toplam_sure=0,bitis_dakika,bitis_saati,bulundu=0,gorusme_say=0;
 
    if((fptr = fopen("gorusme.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Tel no:\n");
        scanf("%s",aranan_telno2);
		telefonla_ara(aranan_telno2);
        printf("\n\nGorusmeler:\n%-20s%-10s%-15s%15s\n","Aranan Tel no","Gun","Baslangic","Bitis");
        printf("%-20s%-10s%-15s%15s\n","_____________","____","_________","_____");
 
    while(!feof(fptr))
        {
            fgets(arayan_telno,8,fptr);
 
            if(strncmp(aranan_telno2, arayan_telno, strlen(aranan_telno2)+1)==0)
            {
                fgets(aranan_telno,11,fptr);
                fscanf(fptr,"%d",&tarih);
                fscanf(fptr,"%d",&baslangic_saati);
                fscanf(fptr,"%d",&baslangic_dakikasi);
				fscanf(fptr,"%d",&saat);
                fscanf(fptr,"%d\n",&dakika);
                gorusme_say++;
				if(baslangic_saati>saat){
					gecici_saat=saat+24;
					toplam_sure+=(gecici_saat-baslangic_saati)*60;
				}
				else
					toplam_sure+=(baslangic_saati-saat)*60;
				if(baslangic_dakikasi>dakika){
					gecici_dakika=dakika+60;
					toplam_sure+=(gecici_dakika-baslangic_dakikasi);
				}
				else
					toplam_sure+=dakika-baslangic_dakikasi;
                if(dakika>=60){
                    saat+=dakika/60;
                    dakika=dakika%60;
 
                }
                printf("%-20s%-10d%d:%-25d%d:%d\n",aranan_telno,tarih,baslangic_saati,baslangic_dakikasi,saat,dakika);
                bulundu=1;
 
            }
 
        }
        if (bulundu==0) printf("\n\n!Girilen telefon numarasina ait gorusme kaydi yok!\n");
    }
                printf("\nToplam sure:%d dk\n",toplam_sure);
                printf("Toplam gorusme sayisi:%d\n",gorusme_say);
	printf("\n\nDevam etmek icin bir tusa basin.\n");
	system("pause");
    fclose(fptr);
    return;
}

void isimle_ara(){
    char telefonno[8];
    char abone_adi[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    char aranan_abone[25];
    int bulundu=0,j;
    char abone_tipi2[9];
 
    FILE *dosya;
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Aramak istediginiz abonenin adini ve soyadini giriniz:\n");
        scanf("%s",aranan_abone);
 
        j=strlen(aranan_abone);
        aranan_abone[j]=' ';
        scanf("%s",aranan_abone+j+1);
 
        fgets(telefonno,8,dosya);
        fgets(abone_adi,26,dosya);
        fgets(adres,31,dosya);
        fscanf(dosya,"%d",&abone_tipi);
        fscanf(dosya,"%d\n",&kontor);
        printf("%-10s%-25s%-30s%-8s%-s\n","Tel no","Ad Soyad","Adres","Tip","Kontor");
        printf("%-10s%-25s%-30s%-8s%-s\n","______","________","_____","____","______");
 
        while(!feof(dosya))
        {
 
            if(strncmp(aranan_abone, abone_adi, strlen(aranan_abone))==0){
                switch (abone_tipi){
            case 1: {
                    sprintf(abone_tipi2,"Sahis");
					break;
					}
            case 2: {
                    sprintf(abone_tipi2,"Isyeri");
                    break;
					}
            case 3: {
					sprintf(abone_tipi2,"Kamu");
					break;
					}
            case 4: {
					sprintf(abone_tipi2,"Guvenlik");
					break;
					}
            break;
				}
 
            printf("%-10s%-20s%-30s%-10s%d\n",telefonno,abone_adi,adres,abone_tipi2,kontor);
            bulundu=1;
            }
 
            fgets(telefonno,8,dosya);
            fgets(abone_adi,26,dosya);
            fgets(adres,31,dosya);
            fscanf(dosya,"%d",&abone_tipi);
            fscanf(dosya,"%d\n",&kontor);
 
        }
 
       }
 
       if (bulundu==0) printf("Aranilan ad soyada ait bir abone bulunamadi!\n");
 	printf("\n\nDevam etmek icin bir tusa basin.\n");
	system("pause");
    fclose(dosya);
    return;
 
}

void tum_bilgiler(){
 
    FILE *dosya;
    char telefonno[8];
    char abone_adi[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    int tip[4]={0};
    char abone_tipi2[9];
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
 
        printf("%-10s%-25s%-30s%-8s%-s\n","Tel no","Ad Soyad","Adres","Tip","Kontor");
        printf("%-10s%-25s%-30s%-8s%-s\n","______","________","_____","____","______");
 
        while(!feof(dosya)){
 
            fgets(telefonno,8,dosya);
            fgets(abone_adi,26,dosya);
            fgets(adres,31,dosya);
            fscanf(dosya,"%d",&abone_tipi);
            fscanf(dosya,"%d\n",&kontor);
 
            switch (abone_tipi){
            case 1: {
                    tip[0]++;
                    sprintf(abone_tipi2,"Sahis");
            break;}
            case 2: {
					tip[1]++;
                    sprintf(abone_tipi2,"Isyeri");
                    break;}
            case 3: {
                tip[2]++;
                sprintf(abone_tipi2,"Kamu");
                break;}
            case 4: {
                tip[3]++;
                sprintf(abone_tipi2,"Guvenlik");
                break;}
            break;}
 
            printf("%-10s%-20s%-30s%-10s%d\n",telefonno,abone_adi,adres,abone_tipi2,kontor);
 
    }
            printf("\n%-20s%-20s\n","Abone Tipi","Abone Sayisi");
            printf("%-20s%-20s\n","__________","____________");
            printf("%-20s%5d\n%-20s%5d\n%-20s%5d\n%-20s%5d\n","Sahis",tip[0],"Isyeri",tip[1],"Kamu",tip[2],"Guvenlik",tip[3]);
 
    }
 	printf("\n\nDevam etmek icin bir tusa basin.\n");
	system("pause");
    fclose(dosya);
 
    return;
}

void gune_gore_gorusmeler(){
 
    FILE *dosya;
    char arayan_telno[8];
    char aranan_telno[11];
    int tarih;
    int baslangic_saati;
    int baslangic_dakikasi;
    int saat;
	int dakika;
	int gecici_saat=0;
	int gecici_dakika=0;
    int toplam_sure=0,bulundu=0,gorusme_say=0,aranan_gun;
 
    if((dosya = fopen("gorusme.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Gunu giriniz:\n");
        scanf("%d",&aranan_gun);
        printf("\n\nGorusmeler:\n%-20s%-20s%-13s%-15s\n","Arayan Tel No","Aranan Tel no","Baslangic","Sure");
        printf("%-20s%-20s%-13s%-15s\n",                 "______________","_____________","_________","____");
  
        while(!feof(dosya)){
 
            fgets(arayan_telno,8,dosya);
            fgets(aranan_telno,11,dosya);
            fscanf(dosya,"%d",&tarih);
            fscanf(dosya,"%d",&baslangic_saati);
            fscanf(dosya,"%d",&baslangic_dakikasi);
			fscanf(dosya,"%d",&saat);
            fscanf(dosya,"%d\n",&dakika);
 
            if(tarih==aranan_gun){
                gorusme_say++;
                if(baslangic_saati>saat){
					gecici_saat=saat+24;
					toplam_sure+=(gecici_saat-baslangic_saati)*60;
				}
				else
					toplam_sure+=(baslangic_saati-saat)*60;
				if(baslangic_dakikasi>dakika){
					gecici_dakika=dakika+60;
					toplam_sure+=(gecici_dakika-baslangic_dakikasi);
				}
				else
					toplam_sure+=dakika-baslangic_dakikasi;
                printf("%-20s%-20s%d:%-12d%d:%d\n",arayan_telno,aranan_telno,baslangic_saati,baslangic_dakikasi,saat,dakika);
                bulundu=1;
            }
        }
 
    if (bulundu==0) printf("\n\nGirilen gune ait gorusme kaydi yok!\n");
    printf("\nToplam sure:%d dk\n",toplam_sure);
    printf("Toplam gorusme sayisi:%d\n",gorusme_say);
    }
 	printf("\n\nDevam etmek icin bir tusa basin.\n");
	system("pause");
    fclose(dosya);
 
    return ;
}
void aylik_gorusmeler(){
 
  FILE *dosya;
    FILE *dosya2;
 
    char telefonno[8];
    char abone_adi[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    char arayan_telno[8];
    char aranan_telno[11];
    int tarih;
    int baslangic_saati;
    int baslangic_dakikasi;
	int saat,toplam_saat=0;
    int dakika,toplam_dakika=0;
    int sure;
    int toplam_sure=0,gorusme_say=0;
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        if((dosya2 = fopen("gorusme.txt","r")) == NULL)
            printf("Dosya acilamadi!\n");
        else
        {
            printf("%-10s%-20s%-20s%-5s\n","Tel no","Ad Soyad","Top Gorusme Say","Sure");
            printf("%-10s%-20s%-20s%-5s\n","______","________","________________","_____");

            while(!feof(dosya)){
                fgets(telefonno,8,dosya);
                fgets(abone_adi,25,dosya);
                fgets(adres,30,dosya);
                fscanf(dosya,"%d",&abone_tipi);
                fscanf(dosya,"%d\n",&kontor);
 
                while(!feof(dosya2)){
                    fgets(arayan_telno,8,dosya2);
                    fgets(aranan_telno,11,dosya2);
                    fscanf(dosya2,"%d",&tarih);
                    fscanf(dosya2,"%d",&baslangic_saati);
                    fscanf(dosya2,"%d",&baslangic_dakikasi);
                    fscanf(dosya2,"%d",&saat);
					fscanf(dosya2,"%d\n",&dakika);
                    if(strncmp(arayan_telno,telefonno,strlen(arayan_telno))==0)
                    {
                        gorusme_say++;
						toplam_saat+=saat;
						toplam_dakika+=dakika;
                    }
 					 if(toplam_dakika>=60){
					  toplam_saat+=dakika/60;
					  toplam_dakika=dakika%60;
					}
                }
                rewind(dosya2);
 
                printf("%-10s%-28s%-13d%-2d:%-2d\n",telefonno,abone_adi,gorusme_say,toplam_saat,toplam_dakika);
 
                gorusme_say=0;
				toplam_saat=0;
				toplam_dakika=0;
 
            }
 
        }
        fclose(dosya2);
    }
    fclose(dosya);
	printf("\n\nDevam etmek icin bir tusa basin.\n");
	system("pause");
}

void abone_ekle(){
 
    FILE *fptr;
    FILE *fptr2;
    char telefonno[8];
    char abone_adi[26];
    char adres[31];
    int abone_tipi;
    int kontor;
    int bulundu=0,yazildi=0;
    char abone[70],bos;
 
    if((fptr = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Telefon no yu giriniz:\n");
        scanf("%s",telefonno);
        fgets(abone,69,fptr);
        while(!feof(fptr))
        {
 
            if(strncmp(telefonno, abone, strlen(telefonno))==0)
            {
               printf("Zaten bu telefon numarasina ait bir kullanici var!\n");
               bulundu=1;
               break;
            }
            fgets(abone,69,fptr);
 
        }
        rewind(fptr);
 
        if(bulundu==0){
            printf("Abonenin adini ve soyadini giriniz:\n");
            scanf("%c",&bos);
            gets(abone_adi);
            printf("Abonenin adresini giriniz:\n");
            gets(adres);
            printf("Abone tipini giriniz:\n");
            scanf("%d",&abone_tipi);
            printf("Abonenin kontor miktarini giriniz:\n");
            scanf("%d",&kontor);
 
            fptr2 = fopen("abone.txt","a");
            fgets(abone,69,fptr);
 
                    fprintf(fptr2,"%s%-25s%-30s%-2d%d\n",telefonno,abone_adi,adres,abone_tipi,kontor);
 

            fclose(fptr2);

 
    }
}
fclose(fptr);
printf("\n\nDevam etmek icin bir tusa basin.\n");
system("pause");
return;
}
void abone_guncelle(){
 
    FILE *dosya;
    FILE *dosya2;
    FILE *dosya3;
    int bulundu=0,bos;
    char abone[70];
    char yeni_adres[26],telefonno[9];
 
    if((dosya = fopen("abone.txt","r")) == NULL)
        printf("Dosya acilamadi!\n");
    else
    {
        printf("Telefon numarasini giriniz:\n"),
        scanf("%s",telefonno);
        while(!feof(dosya))
        {
            fgets(abone,69,dosya);
            if(strncmp(telefonno, abone, strlen(telefonno))==0)
            {
              bulundu=1;
              break;
            }
            else if(strncmp(telefonno, abone, strlen(telefonno))<0) break;
        }
        if(bulundu==0)
            printf("Bu telefon numarasina ait kayit bulunamadi!\n");
        else{
            rewind(dosya);
            dosya2 = fopen("gecici.txt","w");
 
            printf("Yeni adresi giriniz:\n");
            scanf("%d",&bos);
            gets(yeni_adres);
            fgets(abone,69,dosya);
            while(!feof(dosya))
            {
                if(strncmp(telefonno, abone, strlen(telefonno))==0)
                {
                    fwrite(abone,32,1,dosya2); //once dosyaya adres kismina kadar dosyaya yazdirir
                    fprintf(dosya2,"%-30s",yeni_adres); //sonra dosyaya yeni adresi yazdirir
                    fputs(abone+62,dosya2); // daha sonra da geri kalan kisim yazilir
                }
                else
                    fputs(abone,dosya2);
 
                fgets(abone,69,dosya);
            }
			dosya3 = fopen("abone.txt","w+");
            while(!feof(dosya2))
            {
                if(strncmp(telefonno, abone, strlen(telefonno))==0)
                {
                    fwrite(abone,32,1,dosya3); //once dosyaya adres kismina kadar dosyaya yazdirir
                    fprintf(dosya3,"%-30s",yeni_adres); //sonra dosyaya yeni adresi yazdirir
                    fputs(abone+62,dosya3); // daha sonra da geri kalan kisim yazilir
                }
                else
                    fputs(abone,dosya3);
 
                fgets(abone,69,dosya2);
            }
        remove("abone.txt");
        rename("gecici.txt","abone.txt");
        fclose(dosya2);
        }
    fclose(dosya);
    }
	printf("\n\nDevam etmek icin bir tusa basin.\n");
	system("pause");
}

int menu_secim(void)
{
    int secim, secim2;

	printf("1. Sorgulama Programi\n");
	printf("2. Guncelleme Programi\n");
	printf("3. Kontor Yukleme Programi\n");
	printf("4. Cikis\n");
	do {
        printf("\nSeciminizi Giriniz:");
        scanf("%d", &secim);
    } while(secim<1 || secim>4);
	switch(secim){
	case 1:
	system("CLS");
    printf("1. Telefon Numara ile Arama\n");
	printf("2. Bir Abonenin Bilgileri ve O Ayda Yapilan Gorusmelerinin Listelenmesi\n");
	printf("3. Ad Soyad ile Arama\n");
	printf("4. Tum Abone Bilgilerinin Listelenmesi\n");
	printf("5. Bir Gune Ait Gorusmelerin Listelenmesi\n");
	printf("6. Tum Abonelerin Ay Boyunca Yaptigi Gorusmeler\n");
	printf("7. Ana Menuye Don\n");
    printf("\n");
    do {
        printf("\nSeciminizi Giriniz:");
        scanf("%d", &secim2);
    } while(secim2<1 || secim2>7);
	break;
	case 2:
    printf("1. Yeni Abone Ekleme\n");
	printf("2. Bir Abonenin Adres Bilgisini Guncelleme\n");
	printf("3. Gorusme Kaydi Ekleme\n");
	printf("4. Ana Menuye Don\n");
    printf("\n");
    do {
        printf("\nSeciminizi Giriniz:");
        scanf("%d", &secim2);
    } while(secim2<1 || secim2>3);
	break;
	case 3:
    secim2=12;
	break;
	}
	if (secim==2){
		secim2=secim2+7;
	}
    return secim2;
}

int main (void)
{
	int secenek;
	char aranantel[8];
    do {
		system("CLS");
        secenek=menu_secim();
        switch(secenek) {
            case 1:
				system("CLS");
				printf("Aramak istediginiz telefon numarasini giriniz:\n");
				scanf("%s",aranantel);
				telefonla_ara(aranantel);
				printf("\n\nDevam etmek icin bir tusa basin.\n");
				system("pause");
                break;
            case 2:
				system("CLS");
				abone_gorusmeler();
                break;
            case 3:
				system("CLS");
				isimle_ara();
                break;
            case 4:
 				system("CLS");
				tum_bilgiler();
                break;
            case 5:
				system("CLS");
				gune_gore_gorusmeler();
                break;
            case 6:
				system("CLS");
				aylik_gorusmeler();
                break;
            case 7:
                break;
            case 8:
				system("CLS");
				abone_ekle();
                break;
			case 9:
				system("CLS");
				abone_guncelle();
				break;
        }
    } while(secenek!=4);

    return 0;
}
