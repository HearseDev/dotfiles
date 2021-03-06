/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
//static const int vertpad            = 10;       /* vertical padding of bar */
//static const int sidepad            = 10;       /* horizontal padding of bar */
static const char *fonts[]          = { "Liga SFMono Nerd Font:size=10" };
static const char dmenufont[]       = "Liga SFMono Nerd Font:size=10";

//theme colors
static const char black[]       = "#161320";
static const char black2[]      = "#1E1E2E";
static const char gray[]       = "#585767";
static const char rosewater[]   = "#F5E0DC";

static const char *colors[][3]      = {
	/*                    fg      bg      border   */
  [SchemeNorm]       = { gray, black, black },
  [SchemeSel]        = { rosewater, black2, black2},
};

static const char *const autostart[] = {
  "bash","-c","$HOME/.config/dwm/bar.sh", NULL,
	"nm-applet", NULL,
	"blueman-applet", NULL,
	"udiskie", "-t", NULL,
	"pasystray", NULL,
	"flameshot", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6"};

static const unsigned int ulinepad	= 4;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "???",      tile },    /* first entry is default */
	{ "???",      NULL },    /* no layout function means floating behavior */
	{ "???",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {NULL};
static const char *termcmd[]  = { "kitty", NULL };
static const char *medplaypausecmd[] = { "playerctl", "play-pause", NULL };
static const char *mednextcmd[] = { "playerctl", "next", NULL };
static const char *medprevcmd[] = { "playerctl", "previous", NULL };
static const char *medvolup[]={"amixer", "-q", "-D", "pulse", "sset", "Master", "5%+",NULL};
static const char *medvoldown[]={"amixer", "-q", "-D", "pulse", "sset", "Master", "5%-",NULL};
static const char *medvolmute[]={"amixer", "-D", "pulse", "set", "Master", "1+", "toggle",NULL};
static const char *brightnessup[]={"xbacklight", "-inc", "5",NULL};
static const char *brightnessdown[]={"xbacklight", "-dec", "5",NULL};
static const char *rofi[]={"rofi","-show","drun",NULL};
// static const char *rofipower[]={"rofi","-theme", ".config/rofi/nord.rasi","-font","Liga SFMono Nerd Font 9","-show","power-menu","-modi","power-menu:.config/rofi/rofi-power-menu",NULL};
static const char *rofipower[] = {".config/rofi/power", NULL};
static const char *flameshot[]={"flameshot", "gui",NULL};
static const char *fm[]={"nautilus",NULL};
static const char *firefox[]={"firefox",NULL};

#include "movestack.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
  { MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
  { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_space,  spawn,          {.v = rofi} },
	{ MODKEY,                       XK_BackSpace,spawn,      {.v = rofipower} },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd} },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ControlMask,           XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ControlMask,           XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	{ MODKEY|ShiftMask,             XK_q,          quit,       {0} },
	{ MODKEY,                       XK_w,          spawn,      SHCMD("feh --bg-fill $(find $HOME/Pictures/Wallpapers -type f | shuf -n 1)") },
	{ MODKEY,                       XK_apostrophe, spawn,      {.v = firefox} },
	{ MODKEY,                       XK_semicolon,  spawn,      {.v = fm} },
	{ MODKEY,                       XK_Print,      spawn,      {.v = flameshot} },
	{0,                             XF86XK_MonBrightnessUp,   spawn,     {.v = brightnessup} },
	{0,                             XF86XK_MonBrightnessDown, spawn,      {.v = brightnessdown} },
	{0,                             XF86XK_AudioLowerVolume,  spawn,      {.v = medvoldown} },
	{0,                             XF86XK_AudioRaiseVolume,  spawn,      {.v = medvolup} },
	{0,                             XF86XK_AudioMute,         spawn,      {.v = medvolmute} },
  { 0,                            XF86XK_AudioPlay,         spawn,      {.v = medplaypausecmd } },
  { 0,                            XF86XK_AudioNext,         spawn,      {.v = mednextcmd } },
  { 0,                            XF86XK_AudioPrev,         spawn,      {.v = medprevcmd } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
