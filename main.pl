#!/usr/bin/env perl
use strict;
use warnings;
use SDL;
use SDL::Video;
use SDL::Surface;
use SDL::Event;
use SDL::Events;

#Configuration
use constant {
    WINDOW_HEIGHT   => 400,
    WINDOW_WIDTH   => 600
};

#Fonctions
sub get_offset {
  return $_[0] + ($_[1] * WINDOW_HEIGHT);
}

#Initialisation SDL et de la fenetre
SDL::init(SDL::SDL_INIT_VIDEO) && die "SDL init failed";
my $win = SDL::Video::set_video_mode(WINDOW_WIDTH, WINDOW_HEIGHT, 32, SDL_ANYFORMAT);

#Permet de quitter avec ctrl+c
$SIG{INT} = sub { exit };

sleep(2);

#Afficher un pixel
#$win->set_pixels(100 * 600 + 200, )

#Boucle principal du programme
my $e = SDL::Event->new;
while (SDL::Events::wait_event($e)) {

	if($e->type == SDL_MOUSEMOTION) {
		printf("(%d,%d)\n", $e->motion_x, $e->motion_y);
	}

  exit if $e->type == SDL_QUIT;
}


#Rafraichir la page
SDL::Video::update_rect($win, 0, 0, 0, 0);
