from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
assets = Path('assets/images')
assets.mkdir(parents=True, exist_ok=True)
products = [
    'Яблоко','Банан','Морковь','Томат','Груша','Огурец',
    'Курица','Говядина','Свинина','Баранина','Индейка',
    'Пицца','Бургер','Паста','Салат','Суши-сет',
    'Молоко','Сыр','Йогурт','Творог',
    'Хлеб','Булочка','Круассан','Пирожное',
    'Сок','Вода','Кофе','Чай'
]
try:
    font = ImageFont.truetype('arial.ttf', 18)
except Exception:
    font = ImageFont.load_default()
for name in products:
    filename = 'product_' + name.lower().replace(' ', '_').replace('-', '_').replace('ё','е').replace('й','и').replace('ъ','').replace('ь','') + '.png'
    path = assets / filename
    img = Image.new('RGB', (120, 120), (250, 250, 250))
    draw = ImageDraw.Draw(img)
    draw.rectangle([0, 0, 119, 119], fill=(240,240,240))
    draw.rectangle([6, 6, 113, 113], fill=(220, 220, 220), outline=(180,180,180))
    text = name
    bbox = draw.textbbox((0, 0), text, font=font)
    w, h = bbox[2] - bbox[0], bbox[3] - bbox[1]
    if w > 104:
        parts = [p for p in name.split() if p]
        text = ''.join([p[0] for p in parts[:2]]).upper()
        bbox = draw.textbbox((0, 0), text, font=font)
        w, h = bbox[2] - bbox[0], bbox[3] - bbox[1]
    draw.text(((120-w)/2, (120-h)/2), text, fill=(40,40,40), font=font)
    img.save(path)
    print(filename)
