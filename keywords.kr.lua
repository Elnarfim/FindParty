-------------------------------------------
-- 최종수정 : 2025/6/29

-- 각종 필터링 정보를 담고 있는 파일입니다.
-- 패치로 새로운 던전이 추가되거나 난이도가 추가될 경우 이 파일에서 수정하시면 됩니다.
-- 난이도 추가시에는 FindParty.lua 파일에서 별도 처리가 필요할 수도 있습니다.

-- ===============================
-- 난이도 분류 키워드를 정의합니다.
-- dbname은 실제로 애드온에서 인식하는 명칭이며, name은 애드온에서 표시되는 부분입니다.
-- postfix를 입력할 경우 던전 이름 뒤에 입력한 글자가 추가로 표시됩니다.
-- color은 선택한 난이도를 어떤 색상으로 표시할지 정의하는 부분입니다.
-- keywords는 파티모집 문구에 해당 문자열이 있을 경우 해당 난이도로 분류할 수 있도록 정의하는 부분입니다.
-- 10인, 25인, 영웅 난이도는 별도로 처리 합니다.

--[[
	색상 rgb 코드
	보라 (시즌 어픽스) 0.745, 0.27, 0.84
	남색 (던전) 0.5 0.5 0.8
	분홍 (10인 레이드) 1, 0.7, 0.7
	주황 (25인 레이드) 1, 0.5, 0
	노랑 (구 레이드) 1, 0.7, 0
	녹색 (PvP) 0, 1, 0
	청록 (도전 모드) 0, 1, 1
	하늘색 (필드보스) 0, 0.95, 1
	파랑 (탄력적 공격대) 0.4, 0.7, 1
	빨강 (일분일초 버전 명예) 1, 0. 0
]]

FP_DIFFICULTY_KEYWORDS = {
	[1] = {
		name = "도전 모드",
		dbname = "challenge",
		postfix = " |cfffcad03(H+)",
		color = {0, 1, 1},
		keywords = {"도전", "금메달"},
	},
	[2] = {
		name = "영웅",
		dbname = "heroic",
		postfix = " |cffff0000(H)",
		color = {0.5, 0.5, 0.8},
		keywords = {"영웅", "영던", "일영", "0던", "%(0%)", "%(영%)"},
	},
	[3] = {
		name = "일반",
		dbname = "normal",
		postfix = "",
		color = {0.5, 0.5, 0.8},
		keywords = {"일반", "일던", "%(1%)", "%(일%)"},
	},
	[4] = {
		name = "10인",
		dbname = "10normal",
		postfix = " |cff00e1ff(10)",
		color = {1, 0.7, 0.7},
		keywords = {"10"},
	},
	[5] = {
		name = "25인",
		dbname = "25normal",
		postfix = " |cff00e1ff(25)",
		color = {1, 0.5, 0},
		keywords = {"25", "20"},
	},
	[6] = {
		name = "10인 영웅",
		dbname = "10heroic",
		postfix = " |cffff0000(10H)",
		color = {1, 0.7, 0.7},
		keywords = {},
	},
	[7] = {
		name = "25인 영웅",
		dbname = "25heroic",
		postfix = " |cffff0000(25H)",
		color = {1, 0.5, 0},
	},
	[8] = {
		name = "탄력적 공격대",
		dbname = "flex",
		postfix = " |cff00e1ff(F)",
		color = {0.4, 0.7, 1},
		keywords = {"탄력", "탄공"},
	},
	[9] = {
		name = "필드보스",
		dbname = "world",
		postfix = "",
		color = {0, 0.95, 1},
	},
	[10] = {
		name = "구 레이드",
		dbname = "legacy",
		postfix = "",
		color = {1, 0.7, 0},
	},
	[11] = {
		name = "PvP",
		dbname = "pvp",
		postfix = "",
		color = {0, 1, 0},
	},
	[12] = {
		name = "퀘스트",
		dbname = "quest",
		postfix = "",
		color = {1, 1, 1},
	},
}

-- ==============================
-- 던전 분류 키워드를 정의합니다.
-- 아래 모든 필드가 있어야합니다.
-- category는 새로운 분류를 추가할 때 이용하시면 됩니다.
-- name은 던전 이름을 입력하며, 낮은 번호가 우선으로 인식됩니다. 번호가 중복되지 않도록 하여주시기 바랍니다.
-- difficulty는 해당 던전에 존재하는 난이도를 정의하는 부분입니다. 난이도 정의의 dbname에 맞게 입력하셔야 합니다.
-- keywords는 파티모집 문구에 해당 문자열이 있을 경우 해당 난이도로 분류할 수 있도록 정의하는 부분입니다.
-- heroickeywods는 던전 분류후 해당 문자열이 발견될 경우 영웅 난이도로 분류하도록 별도로 정의하는 부분입니다.
-- 시네스트라나 비룡팟등 기본 하드 진행인데, 하드로 분류되지 않는 경우를 대비하여 만들어 졌습니다. 하드 난이도에만 존재하는 네임드의 경우, 이 곳에 키워드를 적을 수 있습니다.
-- 단, 이 경우 던전 분류시 인식하지 않으므로 던전 분류에서 해당 키워드를 기재하여 우선 던전을 인식시키는 작업이 필요합니다. (울두아르를 참고하시기 바랍니다.)
-- excludekeywords는 던전으로 인식되지 않을 키워드를 정의합니다. 다른 던전과 키워드가 겹칠때 사용합니다.

FP_DUNGEON_KEYWORDS = {
	[1] = {
		category = "판다리아의 안개 공격대",
		dungeon = {
			[1] = {
				name = "오그리마 공성전",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic", "flex"},
				keywords = {"오공", "공성전"},
				excludekeywords = {"니우", "공성전투"},
			},
			[2] = {
				name = "천둥의 왕좌",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"천둥", "천왕", "천둥왕"},
				heroickeywords = {"라덴"},
				excludekeywords = {"용사"},
			},
			[3] = {
				name = "영원한 봄의 정원",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"영봄", "정원"},
				excludekeywords = {"신록", "마법학자"},
			},
			[4] = {
				name = "공포의 심장",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"공심", "공포", "심장"},
			},
			[5] = {
				name = "모구샨 금고",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"모구샨", "모구산", "금고", "모금"},
				excludekeywords = {"궁전"},
			},
		},
	},
	[2] = {
		category = "판다리아의 안개 던전",
		dungeon = {
			[1] = {
				name = "무작위 시나리오",
				difficulty = {"normal", "heroic"},
				keywords = {"시나리오"},
			},
			[2] = {
				name = "무작위 던전",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"무작"},
			},
			[3] = {
				name = "니우짜오 사원 공성전투",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"니우짜오", "니우", "사원"},
				excludekeywords = {"오그"},
			},
			[4] = {
				name = "석양문",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"석양"},
			},
			[5] = {
				name = "붉은십자군 수도원",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"수도원"},
				excludekeywords = {"음영파"},
			},
			[6] = {
				name = "붉은십자군 전당",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"전당"},
			},
			[7] = {
				name = "스칼로맨스",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"스칼"},
			},
			[8] = {
				name = "모구샨 궁전",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"궁전", "모궁"},
				excludekeywords = {"금고"},
			},
			[9] = {
				name = "음영파 수도원",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"음영파"},
			},
			[10] = {
				name = "스톰스타우트 양조장",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"양조장"},
			},
			[11] = {
				name = "옥룡사",
				difficulty = {"normal", "heroic", "challenge"},
				keywords = {"옥룡"},
			},
		},
	},
	[3] = {
		category = "판다리아의 안개 필드보스",
		dungeon = {
			[1] = {
				name = "오르도스",
				difficulty = {"world"},
				keywords = {"오르", "오르도스"},--오르 손 오르도스 손 때문에 중복 등록
			},
			[2] = {
				name = "네 천신",
				difficulty = {"world"},
				keywords = {"천신", "츠지", "위론", "흑우", "백호", "쉬엔"},
			},
			[3] = {
				name = "운다스타",
				difficulty = {"world"},
				keywords = {"운다", "운다스타"},-- 마찬가지로 운다 손 운다스타 손 중복 등록
			},
			[4] = {
				name = "나락크",
				difficulty = {"world"},
				keywords = {"나락", "나락크"},-- 운다스타와 동일
			},
			[5] = {
				name = "살리스의 전투부대",
				difficulty = {"world"},
				keywords = {"갈레온", "갈리온"},
			},
			[6] = {
				name = "분노의 샤",
				difficulty = {"world"},
				keywords = {"샤", "분샤"},
			},
		},
	},
	[4] = {
		category = "대격변 공격대",
		dungeon = {
			[1] = {
				name = "용의 영혼",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"용영"},
			},
			[2] = {
				name = "불의 땅",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"불땅"},
				excludekeywords = {"평작"},
			},
			[3] = {
				name = "검은날개 강림지",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"강림지", "검날", "검은날개", "검강", "네파"},
				excludekeywords = {"둥지"},
			},
			[4] = {
				name = "황혼의 요새",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"황요", "요새"},
				excludekeywords = {"시간", "투기장"},
				heroickeywords = {"시네"},
			},
			[5] = {
				name = "네 바람의 왕좌",
				difficulty = {"10normal", "25normal", "10heroic", "25heroic"},
				keywords = {"네바람"},
			},
			[6] = {
				name = "바라딘 요새",
				difficulty = {"10normal", "25normal"},
				keywords = {"바라딘", "톨바"},
				excludekeywords = {"퀘"},
			},
		},
	},
	[5] = {
		category = "대격변 던전",
		dungeon = {
			[1] = {
				name = "시간의 끝",
				difficulty = {"heroic"},
				keywords = {"시끝", "시간의끝"},
			},
			[2] = {
				name = "영원의 샘",
				difficulty = {"heroic"},
				keywords = {"영샘", "영원의"},
				excludekeywords = {"눈"},
			},
			[3] = {
				name = "황혼의 시간",
				difficulty = {"heroic"},
				keywords = {"황혼의", "황시"},
				excludekeywords = {"고원", "요새"},
			},
			[4] = {
				name = "줄구룹",
				difficulty = {"heroic"},
				keywords = {"줄굽", "줄구", "즐구", "줄마트"},
			},
			[5] = {
				name = "줄아만",
				difficulty = {"heroic"},
				keywords = {"줄아만", "공물"},
			},
			[6] = {
				name = "검은바위 동굴",
				difficulty = {"heroic", "normal"},
				keywords = {"검바", "동굴"},
			},
			[7] = {
				name = "그림 바톨",
				difficulty = {"normal", "heroic"},
				keywords = {"그바", "바툴", "바톨", "그림"},
			},
			[8] = {
				name = "바위 심장부",
				difficulty = {"normal", "heroic"},
				keywords = {"바심", "심장부"},
			},
			[9] = {
				name = "시초의 전당",
				difficulty = {"normal", "heroic"},
				keywords = {"시초"},
			},
			[10] = {
				name = "톨비르의 잃어버린 도시",
				difficulty = {"normal", "heroic"},
				keywords = {"톨비르"},
			},
			[11] = {
				name = "파도의 왕좌",
				difficulty = {"normal", "heroic"},
				keywords = {"파도", "파왕"},
			},
			[12] = {
				name = "그림자송곳니 성채",
				difficulty = {"normal", "heroic"},
				keywords = {"그림자", "성채", "송곳니", "그송"},
				excludekeywords = {"우트", "드락", "얼음왕관"},
			},
			[13] = {
				name = "죽음의 폐광",
				difficulty = {"normal", "heroic"},
				keywords = {"폐광"},
			},
		},
	},
	[6] = {
		category = "리치 왕의 분노 공격대",
		dungeon = {
			[1] = {
				name = "얼음왕관 성채",
				difficulty = {"legacy"},
				keywords = {"얼음왕관", "얼왕", "얼성", "리치"},
				excludekeywords = {"투기장"},
			},
			[2] = {
				name = "루비 성소",
				difficulty = {"legacy"},
				keywords = {"루비", "성소", "할리", "할리온"},
				excludekeywords = {"흑요"},
			},
			[3] = {
				name = "아카본 석실",
				difficulty = {"legacy"},
				keywords = {"아카본", "석실"},
			},
			[4] = {
				name = "십자군의 시험장",
				difficulty = {"legacy"},
				keywords = {"십자군", "아눕", "십자"},
			},
			[5] = {
				name = "오닉시아의 둥지",
				difficulty = {"legacy"},
				keywords = {"오닉"},
			},
			[6] = {
				name = "울두아르",
				difficulty = {"legacy"},
				keywords = {"울두", "울드", "알갈론", "요그", "미미론"},
			},
			[7] = {
				name = "흑요석 성소",
				difficulty = {"legacy"},
				keywords = {"흑요", "살타"},
			},
			[8] = {
				name = "영원의 눈",
				difficulty = {"legacy"},
				keywords = {"영눈"},
			},
			[9] = {
				name = "낙스라마스",
				difficulty = {"legacy"},
				keywords = {"낙스"},
			},
		},
	},
	[7] = {
		category = "리치 왕의 분노 던전",
		dungeon = {
			[1] = {
				name = "영혼의 제련소",
				difficulty = {"normal", "heroic"},
				keywords = {"제련", "제련소", "재련", "영제", "3종"},
				excludekeywords = {"영제외"},
			},
			[2] = {
				name = "사론의 구덩이",
				difficulty = {"normal", "heroic"},
				keywords = {"사론", "샤론", "구덩이"},
			},
			[3] = {
				name = "투영의 전당",
				difficulty = {"normal", "heroic"},
				keywords = {"투영", "투전"},
			},
			[4] = {
				name = "용사의 시험장",
				difficulty = {"normal", "heroic"},
				keywords = {"용사", "마상", "시험장"},
				excludekeywords = {"십자군", "천둥왕", "부른다"},
			},
			[5] = {
				name = "군드락",
				difficulty = {"normal", "heroic"},
				keywords = {"군드"},
			},
			[6] = {
				name = "돌의 전당",
				difficulty = {"normal", "heroic"},
				keywords = {"돌전", "돌의"},
			},
			[7] = {
				name = "드락타론 성채",
				difficulty = {"normal", "heroic"},
				keywords = {"드락타론", "드락"},
				excludekeywords = {"줄드락"},
			},
			[8] = {
				name = "마력의 눈",
				difficulty = {"normal", "heroic"},
				keywords = {"마눈", "마력의 눈", "마력의눈"},
			},
			[9] = {
				name = "마력의 탑",
				difficulty = {"normal", "heroic"},
				keywords = {"마탑", "마력의 탑", "마력의탑"},
			},
			[10] = {
				name = "번개의 전당",
				difficulty = {"normal", "heroic"},
				keywords = {"번개", "번전", "번던"},
			},
			[11] = {
				name = "보랏빛 요새",
				difficulty = {"normal", "heroic"},
				keywords = {"보요"},
				excludekeywords = {"정복"},
			},
			[12] = {
				name = "아졸네룹",
				difficulty = {"normal", "heroic"},
				keywords = {"아졸", "아줄"},
			},
			[13] = {
				name = "안카헤트: 고대 왕국",
				difficulty = {"normal", "heroic"},
				keywords = {"안카"},
			},
			[14] = {
				name = "옛 스트라솔름",
				difficulty = {"normal", "heroic"},
				keywords = {"옛솔", "옛솔름", "옛솔룸"},
			},
			[15] = {
				name = "우트가드 성채",
				difficulty = {"normal", "heroic"},
				keywords = {"우트가드 성채", "우트가드성채", "성채", "우트성채", "우투성채"},
				excludekeywords = {"얼음왕관", "얼왕", "드락타론", "드락", "그림자", "그송", "지옥불"},
			},
			[16] = {
				name = "우트가드 첨탑",
				difficulty = {"normal", "heroic"},
				keywords = {"우트가드 첨탑", "우트가드첨탑", "첨탑", "우트첨탑", "우투첨탑"},
				excludekeywords = {"검은바위", "하층", "상층"},
			},
		},
	},
	[8] = {
		category = "불타는 성전 공격대",
		dungeon = {
			[1] = {
				name = "태양샘 고원",
				difficulty = {"legacy"},
				keywords = {"태양샘", "태샘"},
			},
			[2] = {
				name = "검은 사원",
				difficulty = {"legacy"},
				keywords = {"검사"},
				excludekeywords = {"안퀴"},
			},
			[3] = {
				name = "하이잘 정상",
				difficulty = {"legacy"},
				keywords = {"하이잘"},
			},
			[4] = {
				name = "폭풍우 요새",
				difficulty = {"legacy"},
				keywords = {"폭요", "폭풍우"},
			},
			[5] = {
				name = "불뱀 제단",
				difficulty = {"legacy"},
				keywords = {"불뱀", "제단"},
			},
			[6] = {
				name = "그룰의 둥지",
				difficulty = {"legacy"},
				keywords = {"그룰", "그롤"},
				excludekeywords = {"대학살", "그룰록"},
			},
			[7] = {
				name = "마그테리돈의 둥지",
				difficulty = {"legacy"},
				keywords = {"마그"},
			},
			[8] = {
				name = "카라잔",
				difficulty = {"legacy"},
				keywords = {"카라잔", "정문", "후문"},
				excludekeywords = {"솔름", "솔룸", "솔롬", "솔륨", "스솔", "퀘"},
			},
			[9] = {
				name = "필드보스 (불성)",
				difficulty = {"legacy"},
				keywords = {"카자크", "카작", "절단기"},
				excludekeywords = {"폭요", "폭풍우", "지옥절단기"},
			},
		},
	},
	[9] = {
		category = "불타는 성전 던전",
		dungeon = {
			[1] = {
				name = "마법학자의 정원",
				difficulty = {"normal", "heroic"},
				keywords = {"마법학자", "마정"},
				excludekeywords = {"신록", "영원"},
			},
			[2] = {
				name = "메카나르",
				difficulty = {"normal", "heroic"},
				keywords = {"메카"},
			},
			[3] = {
				name = "알카트라즈",
				difficulty = {"normal", "heroic"},
				keywords = {"알카"},
			},
			[4] = {
				name = "신록의 정원",
				difficulty = {"normal", "heroic"},
				keywords = {"신록"},
				excludekeywords = {"마법학자", "영원"},
			},
			[5] = {
				name = "어둠의 미궁",
				difficulty = {"normal", "heroic"},
				keywords = {"미궁"},
			},
			[6] = {
				name = "세데크 전당",
				difficulty = {"normal", "heroic"},
				keywords = {"세데크", "세덱", "안주"},
			},
			[7] = {
				name = "아키나이 납골당",
				difficulty = {"normal", "heroic"},
				keywords = {"납골당", "납골"},
			},
			[8] = {
				name = "마나 무덤",
				difficulty = {"normal", "heroic"},
				keywords = {"마나", "무덤", "마나무덤"},
				excludekeywords = {"괴철로"},
			},
			[9] = {
				name = "증기 저장고",
				difficulty = {"normal", "heroic"},
				keywords = {"증기", "저장고", "저장소"},
			},
			[10] = {
				name = "지하 수렁",
				difficulty = {"normal", "heroic"},
				keywords = {"수렁"},
			},
			[11] = {
				name = "강제 노역소",
				difficulty = {"normal", "heroic"},
				keywords = {"노역소", "노역", "강노"},
			},
			[12] = {
				name = "으스러진 손의 전당",
				difficulty = {"normal", "heroic"},
				keywords = {"으스", "으손", "으스스"},
			},
			[13] = {
				name = "피의 용광로",
				difficulty = {"normal", "heroic"},
				keywords = {"피용", "용광로"},
			},
			[14] = {
				name = "지옥불 성루",
				difficulty = {"normal", "heroic"},
				keywords = {"성루"},
			},
			[15] = {
				name = "검은늪",
				difficulty = {"normal", "heroic"},
				keywords = {"검은늪", "검늪"},
			},
			[16] = {
				name = "옛 힐스브래드 구릉지",
				difficulty = {"normal", "heroic"},
				keywords = {"힐스", "옛힐스"},
			},
		},
	},
	[10] = {
		category = "오리지널 공격대",
		dungeon = {
			[1] = {
				name = "안퀴라즈 사원",
				difficulty = {"legacy"},
				keywords = {"안퀴사원", "안퀴"},
				excludekeywords = {"폐허", "페허", "가라앉은", "검은", "학카르"},
			},
			[2] = {
				name = "안퀴라즈 폐허",
				difficulty = {"legacy"},
				keywords = {"안퀴폐허", "폐허", "페허"},
			},
			[3] = {
				name = "검은날개 둥지",
				difficulty = {"legacy"},
				keywords = {"검둥"},
			},
			[4] = {
				name = "화산 심장부",
				difficulty = {"legacy"},
				keywords = {"화심"},
			},
		},
	},
	[11] = {
		category = "오리지널 던전",
		dungeon = {
			[1] = {
				name = "가시덩굴 구릉",
				difficulty = {"normal"},
				keywords = {"구릉", "구렁", "구룽"},
				excludekeywords = {"회색", "구릉지"},
			},
			[2] = {
				name = "가시덩굴 우리",
				difficulty = {"normal"},
				keywords = {"우리"},
				excludekeywords = {"마우리"},
			},
			[3] = {
				name = "검은심연의 나락",
				difficulty = {"normal"},
				keywords = {"심연", "검은심연", "검은심연의"},
				excludekeywords = {"바위", "심연의홀", "홀"},
			},
			[4] = {
				name = "검은바위 나락",
				difficulty = {"normal"},
				keywords = {"나락", "윈저"},
				excludekeywords = {"심연"},
			},
			[5] = {
				name = "검은바위 첨탑 하층",
				difficulty = {"normal"},
				keywords = {"하층"},
				excludekeywords = {"우트가드"},
			},
			[6] = {
				name = "검은바위 첨탑 상층",
				difficulty = {"normal"},
				keywords = {"상층", "드라키"},
				excludekeywords = {"우트가드"},
			},
			[7] = {
				name = "놈리건",
				difficulty = {"normal"},
				keywords = {"놈리"},
			},
			[8] = {
				name = "마라우돈",
				difficulty = {"normal"},
				keywords = {"마라우돈", "우동", "마라"},
			},
			[9] = {
				name = "붉은십자군 수도원",
				difficulty = {"normal"},
				keywords = {"수도원", "도서관", "무기고", "성당", "예배당", "1번", "2번", "3번", "4번"},
			},
			[10] = {
				name = "성난불길 협곡",
				difficulty = {"normal"},
				keywords = {"성난불길", "성불"},
			},
			[11] = {
				name = "스톰윈드 지하감옥",
				difficulty = {"normal"},
				keywords = {"감옥"},
			},
			[12] = {
				name = "스칼로맨스",
				difficulty = {"normal"},
				keywords = {"스칼", "교장"},
			},
			[13] = {
				name = "스트라솔름",
				difficulty = {"normal"},
				keywords = {"솔름", "솔룸", "솔륨", "솔롬", "스솔"},
				excludekeywords = {"옛", "영웅", "영던"},
			},
			[14] = {
				name = "아탈학카르 신전",
				difficulty = {"normal"},
				keywords = {"학카르", "학칼", "아탈", "가라앉은"},
			},
			[15] = {
				name = "울다만",
				difficulty = {"normal"},
				keywords = {"울다만"},
			},
			[16] = {
				name = "줄파락",
				difficulty = {"normal"},
				keywords = {"줄파"},
				excludekeywords = {"투기장"},
			},
			[17] = {
				name = "통곡의 동굴",
				difficulty = {"normal"},
				keywords = {"통곡"},
			},
			[18] = {
				name = "혈투의 전장",
				difficulty = {"normal"},
				keywords = {"혈투", "혈장"},
			},
		},
	},
	[12] = {
		category = "PvP",
		dungeon = {
			[1] = {
				name = "투기장",
				difficulty = {"pvp"},
				keywords = {"투기장", "투기", "점먹", "8승", "10승", "2V2", "2VS2", "2대2", "3V3", "3VS3", "3대3","5V5", "5VS5", "5대5", "2:2", "3:3", "5:5"},
				excludekeywords = {"퀘", "쐐기", "길드", "투기장퀘", "나그란드", "나그", "줄드", "회색구릉지", "구릉", "퀘스트", "정복", "피의", "고뇌", "발할라스", "얼음왕관", "투기장:", "도가니", "황혼", "황고"},
			},
			[2] = {
				name = "전장",
				difficulty = {"pvp"},
				keywords = {"명점", "쟁", "전장", "아라시", "알방", "노래방", "토방", "룰방", "분지", "폭눈", "길니", "전투지", "쌍봉", "봉우리", "바라드"},
				excludekeywords = {"퀘", "쐐기", "길드", "하실"},
			},
		},
	},
	[13] = {
		name = "퀘스트",
		difficulty = {"quest"},
		keywords = {"퀘", "하실", "입장퀘", "투기장", "도가니", "평작"},
		excludekeywords = {"골팟", "올분", "참석", "길드", "하신", "명점", "쟁", "전장", "킬하실"},
	},
}

-- 하드 난이도를 위한 별도 처리 부분입니다. 던전 모집 문구에 해당 문자열이 포함되어 있을 경우 하드 난이도로 분류 합니다.
FP_HEROIC_KEYWORDS = {"영웅", "하드", "HARD"}

-- 모든 무시 키워드는 각단계 별로 별도로 제거 됩니다.
-- 즉, 다른 단계에서 사용한 키워드가 있다면 해당 단계에서 제거하는 것이 좋습니다.
-- 던전명 인식시 해당 문자열을 제거한후 던전명을 인식합니다. 오인식이 자주되는 키워드 위주로 추가하면 좋습니다.
-- 이를테면 도적의 키워드가 "도" 이고, 난이도 인식시 사용하는 키워드가 "도전" 이면, 직업 필터링에 "도전"을 추가하면 
-- 도전 모드는 정상적으로 인식되며 "도전" 을 도적으로 오인식하는 경우가 줄어듭니다.
-- 영어 사용시 대문자로만 적으세요. (자동으로 대문자 변환함)
FP_DUNGEON_IGNORE_KEYWORDS = {
	"할줄아",--줄아만 오분류
	"얼마나",--마나 무덤 오분류
}

-- 던전 이름 뒤에 다음 문자열이 기록되어 있으면 무시합니다.
-- 운다손, 갈레온손 같은 경우를 제거하기 위함입니다.
FP_DUNGEON_IGNORE_POSTFIX_KEYWORDS = {
	"손",--운다 손
	"뜸",--운다 뜸
	"없",--운다 없나요?
	"ㅅ"--운다 ㅅㅅ
}

-- 난이도명 인식시 해당 문자열을 제거한후 난이도명을 인식합니다. 오인식이 자주되는 키워드 위주로 추가하면 좋습니다.
FP_DIFFICULTY_IGNORE_KEYWORDS = {
	--시간 관련 문자열들 제거
	"OR", "AND", "1탐", "2탐", "일시", "1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시", "9시", "10시", "11시", "12시", "20시", "22시", "~1", "~10", ":33", "~33", "~20", "1~", "10~", "20~", "22:", "22~", ":55", "~55", "55분", "1:", "10:", "20:", ":0", ":1", "10월",
	--기타 오인식 문자열 제거
	"10/", "10렙", "10레벨", "250", "25일", "25렙", "25레벨", "1레벨", "1렙", "LV.25", "하드X", "10하드"
}

-- 목록 툴팁에서 가독성에 영향을 주는 문자열을 사전 제거 합니다. 가능한 최소로 사용하세요.
FP_TOOLTIP_IGNORE_KEYWORDS = {
	-- 툴팁에는 징표가 표시되지 않으므로 제거
	"{해골}", "{별}", "{다이아몬드}", "{세모}", "{가위표}", "{동그라미}", "{달}", "{네모}", "{rt1}", "{rt2}", "{rt3}", "{rt4}", "{rt5}", "{rt6}", "{rt7}", "{rt8}"
}

-- 스팸 메시지 필터링 문자열
FP_GLOBAL_EXCLUDE_KEYWORDS = {
	"검사x",
	"길드에서",
	"길드원",
	"길드는",
	"길원",
	"친목",
	"렙업",
	"레벨업",
	"레벨링",
	"삽니다",
	"닌자",
	"먹튀",
}
