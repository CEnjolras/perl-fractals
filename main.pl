#!/usr/bin/env perl
use strict;
use warnings;
use Math::Complex;
use SDL;
use SDL::Video;
use SDL::Surface;
use SDL::Event;
use SDL::Events;

#Configuration
use constant {
    WINDOW_HEIGHT   => 400,
    WINDOW_WIDTH   => 600,
    X => 0,
    Y => 1
};

#Initialisation SDL et de la fenetre
SDL::init(SDL::SDL_INIT_VIDEO) && die "SDL init failed";
my $win = SDL::Video::set_video_mode(WINDOW_WIDTH, WINDOW_HEIGHT, 32, SDL_ANYFORMAT);

#Permet de quitter avec ctrl+c
$SIG{INT} = sub { exit };

#Fonctions
sub easy_set_pixels {
	$_[3]->set_pixels($_[0] + ($_[1] * WINDOW_WIDTH), $_[2]);
}

#Recupere un imaginaire en fonction de la position du pixel et du repere
sub get_complexe {
	my $x = ($_[0])[8];
	my $y = ($_[0])[5];

	printf("$y\n\n\n");

	my $x_scale = abs((-2) * 1)*2 / WINDOW_WIDTH;
	my $y_scale = abs((1) * 1)*2 / WINDOW_HEIGHT;

	my $real = (-2) + ($x * $x_scale);
	my $imaginary = 1 + ($y * $y_scale);

	return $real + $imaginary * i;
}


#Afficher un pixel
easy_set_pixels(100, 200, [0,0,255], $win);

my $c = get_complexe((100, 200));

my $reel = Re($c);
my $ima = Im($c);

printf("Re=$reel, Im=$ima \n");







#Boucle principal du programme
my $e = SDL::Event->new;
while (SDL::Events::wait_event($e)) {

	if($e->type == SDL_MOUSEMOTION) {
		#printf("(%d,%d)\n", $e->motion_x, $e->motion_y);

		#my $c = get_complexe(($e->motion_x, $e->motion_y));
		#my $reel = Re($c);
		#my $ima = Im($c);

		#printf("Re=$reel, Im=$ima \n");
	}

  exit if $e->type == SDL_QUIT;
}


#Rafraichir la page
SDL::Video::update_rect($win, 0, 0, 0, 0);
