clear;
clc;
close all;


ticketnum = 100;
chancemiss = 0.02;
lambda = ticketnum*chancemiss;


%% A
estNotEnough = poisscdf(1,lambda);

%% B

notEnough = binocdf(1,ticketnum,chancemiss);

%% C

noReimburse = poisspdf(2,lambda)/poisscdf(2,lambda);
