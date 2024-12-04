# vRP_LimitItem

`vRP_LimitItem`은 vRP 서버에서 아이템 거래할때 아이템의 거래 갯수를 제한할수 있는 스크립트입니다.
---

## 🚀 설치방법/Installation
- 구문을 복사후 아래 경로부분에 덮어씌어주세요.
- 경로 : vrp/modules/inventory.lua
- modules/inventory.lua 에서 ch_give 부분을 검색합니다.
- 검색후, ch_give 부분을 제공된 구문으로 붙여넣으시면 설치 끝입니다.

## 📦 아이템 수량 변경방법/Change Item Amount
- 제공된 구문에서 if amount > 100 then 부분을 수정하면됩니다.
- 현재 제공된 구문에는 100개 이상부터 거래가 불가능하게 되어있으며, 만일 아이템 거래제한을 500개 까지 하고싶으시면 amount > 100 부분을 amount > 500 으로 수정하시면 됩니다.

## 🚨 **주의사항**
이 스크립트는 **vRP** 프레임워크에서 작동하며 다른 프레임워크(ESX 등등.. ) 에서는 별도의 컨버팅 과정이 필요할수있습니다.
