clear all;
close all;
clc;


%% Dissimulation fichier binaire (jusqu'à 536 870 911 octets soit 536 Mo)
[fileName,path] = uigetfile('*.jpg','Choisir une image porteuse');
pathImagePorteuse = strcat(path,fileName);

[fileName,path] = uigetfile('*.*','Choisir un fichier binaire à dissimuler dans limage porteuse');
pathFichierBinaire = strcat(path,fileName);

[fileName,path] = uiputfile('*.bmp','Choisir le nom de l image à sauvegardée');
pathImageModifiee = strcat(path,fileName);

trameFichierBinaire = fileBin2trameBin(pathFichierBinaire);
dissimulerTrameBinaireDansImage(pathImagePorteuse,trameFichierBinaire,pathImageModifiee);


%% Extraction fichier binaire
[fileName,path] = uiputfile('*.*','Choisir le nom du fichier binaire à sauvegarder');
pathFichierBinaire = strcat(path,fileName);

trameFichierBinaire2 = extraireTrameBinaireDuneImage(pathImageModifiee);
trameBin2fileBin(trameFichierBinaire2,pathFichierBinaire);
