from libqtile import bar, widget

BAR_COLORS = {
    'bar': '#282a36',
    'lightBar': '#44475a',
    'gengar': '#7b62a4',
    'gengar_dark': '#5a4a9c',
    'eye_dark': '#ff5a5a',
    'eye_light':'#ff9494',
    'inactive': '#16171d',
}

BAR_MARGIN = 6

def corner(icon, foreground, background=None):
    return widget.TextBox(
        background=background,
        foreground=foreground,
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
        highlight_color=[BAR_COLORS['gengar_dark'], BAR_COLORS['eye_dark']],
        highlight_method='line',
        inactive=BAR_COLORS['inactive'],
        padding=0,
        spacing=5,
        this_current_screen_border=BAR_COLORS['eye_light'],
        this_screen_border=BAR_COLORS['eye_light'],
    )

def battery():
    return widget.Battery(
        charge_char='\uf584',
        discharge_char='\uf57e',
        empty_char='\uf582',
        format='{char} {percent:2.0%}',
        padding=10
    )

def memory(background):
    return widget.Memory(
        background=background,
        format='\uf2db {MemUsed} M | {MemTotal} M'
    )

def storage(background):
    return widget.DF(
        background=background,
        format='\uf7c9 [{uf}{m} | {r:.0f}%]', 
        measure='G',
        padding=10, 
        visible_on_warn=False, 
        warn_space=5,
    )

def wireless(background):
    return widget.Net(
        background=background,
        format='\uf1eb  {up} | {down}',
        interface='wlo1', 
        interval=100000,
        padding=10
    )

def cpu(background):
    return widget.CPU(
        background=background,
        format='\ufb19 {freq_current}GHz {load_percent}%',
    )

def status_bar_top():
    return bar.Bar(
        [
            icon(),
            widget.CurrentLayoutIcon(scale=0.66),
            corner('\ue0c7', BAR_COLORS['lightBar']),
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
            widget.Clock(background=BAR_COLORS['lightBar'],format='%a %H:%M', padding=10),
            corner('\ue0c7', BAR_COLORS['bar'], BAR_COLORS['lightBar']),
            battery(),
            widget.QuickExit(countdown_format='{}', default_text='\uf011', padding=25),
        ],
        24,
        background=BAR_COLORS['bar'],
        margin=BAR_MARGIN
    )

def status_bar_bottom():
    return bar.Bar(
        [
            widget.Spacer(length=bar.STRETCH),
            corner('\ue0c7', BAR_COLORS['gengar_dark'], BAR_COLORS['bar']),
            wireless(BAR_COLORS['gengar_dark']),
            corner('\ue0c7', BAR_COLORS['gengar'], BAR_COLORS['gengar_dark']),
            memory(BAR_COLORS['gengar']),
            corner('\ue0c7', BAR_COLORS['eye_dark'], BAR_COLORS['gengar']),
            cpu(BAR_COLORS['eye_dark']),
            corner('\ue0c7', BAR_COLORS['eye_light'], BAR_COLORS['eye_dark']),
            storage(BAR_COLORS['eye_light'])
        ],
        24,
        background=BAR_COLORS['bar'],
        margin=BAR_MARGIN
    )
