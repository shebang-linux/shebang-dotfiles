use strict;
use warnings;
use Irssi;

sub sig_message_public {
    my ($server, $msg, $nick, $address, $target) = @_;

    my $notification_msg = "[$target] $nick: $msg";

    system("notify=\$(notify-send -u low -i notification-message-im -A 'open=Open IRC' '$notification_msg') && [[ \$notify == 'open' ]] && [[ \$(tmux list-sessions -F '#{session_name} #{session_attached}' | grep '^irc 0\$') ]] && exec xterm -e tmux attach -t irc >/dev/null 2>&1 &");
}

sub sig_message_private {
    my ($server, $msg, $nick, $address) = @_;

    system("notify=\$(notify-send -u low -i notification-message-im -A 'open=Open IRC' '$nick' '$msg') && [[ \$notify == 'open' ]] && [[ \$(tmux list-sessions -F '#{session_name} #{session_attached}' | grep '^irc 0\$') ]] && exec xterm -e tmux attach -t irc >/dev/null 2>&1 &");
}

Irssi::signal_add('message public', 'sig_message_public');
Irssi::signal_add('message private', 'sig_message_private');
