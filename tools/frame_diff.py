import sys
from PIL import Image, ImageChops

out = []
try:
    a = Image.open("player1.png").convert("L")
    b = Image.open("player2.png").convert("L")
    if a.size == b.size:
        diff = ImageChops.difference(a, b)
        px = list(diff.getdata())
        changed = sum(1 for v in px if v > 16) / len(px) * 100
        out.append(f"changed_pixels_percent={changed:.2f}")
    else:
        out.append(f"size_mismatch={a.size} vs {b.size}")
except Exception as e:
    out.append(f"player_diff_error={e}")
try:
    h = Image.open("home.png").convert("L")
    hp = list(h.getdata())
    out.append(f"home_mean_brightness={sum(hp) / len(hp):.1f}")
    p = Image.open("player1.png").convert("L")
    pp = list(p.getdata())
    out.append(f"player_mean_brightness={sum(pp) / len(pp):.1f}")
except Exception as e:
    out.append(f"brightness_error={e}")
open("frame-diff.txt", "w").write("\n".join(out) + "\n")
print("\n".join(out))
