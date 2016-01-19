#!/usr/bin/env perl

use strict;
use warning;
use SDL;

#Initialisation de SDL
SDL::init(SDL::SDL_INIT_VIDEO) && die "SDL init failed";
my $win = SDL::Video::set_video_mode(600, 400, 32, SDL_ANYFORMAT);

#Permet de quitter avec ctrl+c
$SIG{INT} = sub { exit };

#Rafraichir la page
SDL::Video::update_rect($win, 0, 0, 0, 0);