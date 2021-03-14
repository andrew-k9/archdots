from libqtile import bar, widget

BAR_COLORS = {
    'bar': '#282a36',
    'lightBar': '#44475a',
    'gengar': '#7b62a4',
}

BAR_MARGIN = 6

def corner(icon, color, background=None):
    """ 
        Adds in a color transition corner icon
        @param: icon   - nerd font icon 
        @param: color  - hex color
        @param: background - background hex color
    """
    return widget.TextBox(
        background=background,
        foreground=color,
        fontsize=24,
        text=icon
    )

def icon():
    return widget.TextBox(
        padding=8,
        text='\uf91c', 
    )

def group_box():
    return widget.GroupBox(
        background=BAR_COLORS['lightBar'],
        highlight_method='line',
        padding=0,
        spacing=5
    )

def status_bar_top():
    return bar.Bar(
        [
            icon(),
            widget.CurrentLayout(fmt='| {} |', padding=5),
            corner('\ue0c5', BAR_COLORS['lightBar']),
            group_box(),
            corner('\ue0c7', BAR_COLORS['gengar'], BAR_COLORS['lightBar']),
            widget.Prompt(background=BAR_COLORS['gengar']),
            widget.WindowName(background=BAR_COLORS['gengar']),
            widget.Chord(
                chords_colors={
                    'launch': ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),

            corner('\ue0c7', BAR_COLORS['lightBar'], BAR_COLORS['gengar']),
            widget.Clock(background=BAR_COLORS['lightBar'],format='%a %H:%M'),
            widget.QuickExit(),
        ],
        24,
        background=BAR_COLORS['bar'],
        margin=BAR_MARGIN
    )

def status_bar_bottom():
    return bar.Bar(
        [
            widget.Net(interface="wlo1", interval=100000),
        ],
        24,
        background=BAR_COLORS['bar'],
        margin=BAR_MARGIN
    )
