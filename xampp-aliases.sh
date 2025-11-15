alias xampp='sudo /opt/lampp/lampp'

# === XAMPP Aliases (CachyOS) ===
function xstart
    echo "Starting XAMPP..."
    sudo /opt/lampp/lampp start
end

function xstop
    echo "Stopping XAMPP..."
    sudo /opt/lampp/lampp stop
end

function xrestart
    echo "Restarting XAMPP..."
    sudo /opt/lampp/lampp restart
end

function xstatus
    sudo /opt/lampp/lampp status
end
