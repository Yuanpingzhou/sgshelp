//
//  AWAppDelegate.m
//  sgshelp
//
//  Created by  on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AWAppDelegate.h"
#import "AWBasicTVC.h"


@implementation AWAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSDictionary* heroDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                @"奸雄——你可以立即获得对你成伤害的牌。\n护驾——主公技，当你需要使用（或打出）一张【闪】时，你可以发动护驾。所有“魏”势力角色按行动顺序依次选择是否打出一张【闪】“提供”给你（然后视为由你使用或打出），直到有—名角色或没有任何角色决定如此做时为止。\n★同一张牌的一次完整的结算中（包括因结算引发的其他事件）只能发动一次奸雄。",
                @"曹　操",
                @"裸衣——摸牌阶段，你可以少摸一张牌；若如此做，该回合的出牌阶段，你使用【杀】或【决斗】（你为伤害来源时）造成的伤害+1。",
                @"许　褚",
                @"反馈——你可以立即从对你造成伤害的来源处获得一张牌。\n鬼才——在任意角色的判定牌生效前，你可以打出一张手牌代替之。\n★一次无论收到多少点伤害，反馈只能获得一张牌，若选择手牌则从对方手里随机抽取，选择面前的装备则由你任选。",
                @"司马懿",
                             @"刚烈——你每受到一次伤害，可进行一次判定：若结果不为红桃，则目标来源须进行二选一：弃两张手牌或者受到你对其造成的1点伤害。",
                             @"夏侯惇",
                             @"天妒——在你的判定牌生效后，你可以立即获得它。\n遗计——你每受到1点伤害，可摸两张牌，将其中的一张交给任意一名角色，然后将另一张交给任意一名角色。\n★天妒技能时机为判定结果决定后。",
                             @"郭　嘉",
                             @"突袭——摸牌阶段，你可以放弃摸牌，然后从至多两名（至少一名）角色的手牌里各随机获得一张牌。\n★摸牌阶段，你一旦发动突袭，就不能从牌堆获得牌；只剩一名其他角色时，你就只能选择着一名角色；若此时其他任何人都没有手牌，你就不能发动突袭。",
                             @"张　辽",
                             @"倾国——你可以将你的黑色手牌当【闪】使用（或打出）。\n洛神——回合开始阶段，你可以进行判定：若为黑色，立即获得此生效后的判定牌，并可以再次使用洛神——如此反复，直到出现红色或你不愿意判定了为止。",
                             @"甄　姬",
                             @"仁德——出牌阶段，你可以将任意数量的手牌以任意分配方式交给其他角色，若你给出的牌张数不少于两张时，你回复1点体力。\n激将——主公技，当你需要使用（或打出）一张【杀】时，你可以发动激将。所有“蜀”势力角色按行动顺序依次选择是否打出一张【杀】“提供”给你（视为由你使用或打出），直到有一名角色或没有任何角色决定如此做时为止。\n★仁德分出的牌，对方无法拒绝。",
                             @"刘　备",
                             @"武圣——你可以将你的任意一张红色牌当【杀】使用或打出。\n★若同时用到当前装备的红色装备效果时，不可把这张装备牌当【杀】来使用或打出。",
                             @"关　羽",
                             @"咆哮——出牌阶段，你可以使用任意数量的【杀】。",
                             @"张　飞",
                             @"马术——锁定技，当你计算与其他角色的距离时，始终-1。\n铁骑——当你使用【杀】，并指定了一名角色为目标后，你可以进行判定，若结果为红色，此【杀】不可被闪避。\n★【马术】的效果与装备【-1马】时很像，但你仍然可以装备一匹【-1马】。",
                             @"马　超",
                             @"龙胆——你可以将你手牌的【杀】当【闪】，【闪】当【杀】使用（或打出）。",
                             @"赵　云",
                             @"观星——回合开始阶段，你可以观看牌堆顶的X张牌（×为存活角色的数量且最多为5），将其中任意数量的牌以任意顺序置于牌堆顶，其余则以任意顺序置于牌堆底。\n空城——锁定技，当你没有手牌时，你不能成为【杀】或【决斗】的目标。",
                             @"诸葛亮",
                             @"集智——每当你使用一张非延时类锦囊时，（在它结算之前）可以立即摸一张牌。\n奇才——锁定技，你使用任何锦囊无距离限制。",
                             @"黄月英",
                             @"制衡——出牌阶段，你可以弃置任意数量的牌，然后摸取等量的牌。每回合限用一次。\n救援——主公技，锁定技，（其他）“吴”势力角色在你濒死状态下对你使用【桃】时，你额外回复1点体力。",
                             @"孙　权",
                            @"英姿——摸牌阶段，你可以额外摸一张牌。\n反间——出牌阶段，你可以指定一名目标角色：该角色选择一种花色，抽取你的一张手牌并亮出，若此牌与所选花色不吻合，则你对该角色造成1点伤害。无论结果如何该角色获得此牌。每回合限用一次。",
                             @"周　瑜",
                             @"奇袭——出牌阶段，你可以将你的任意黑色牌当【过河拆桥】使用。",
                             @"甘　宁",
                             @"克己——若你于出牌阶段未使用或打出过任何一张【杀】，你可以跳过此回合的弃牌阶段。\n★换言之，此回合你的手牌无上限。",
                             @"吕　蒙",
                             @"苦肉——出牌阶段，你可以失去一点体力，然后摸两张牌。每回合中，你可以多次使用苦肉。\n★当你失去最后一点体力时，优先结算濒死事件，当你被救活后，你才可以摸两张牌。换言之，你可以用此技能自杀。",
                             @"黄　盖",
                             @"谦逊——锁定技，你不能成为【顺手牵羊】和【乐不思蜀】的目标。\n连营——每当你失去最后一张手牌时，可立即摸一张牌。",
                             @"陆　逊",
                             @"结姻——出牌阶段，你可以弃两张手牌并指定一名受伤的男性角色：你和目标角色各回复1点体力。每回合限用一次。\n枭姬——当你失去一张装备区里的牌时，你可以立即摸两张牌。",
                             @"孙尚香",
                             @"国色——出牌阶段，你可以将你任意方块花色的牌当【乐不思蜀】使用。\n流离——当你成为【杀】的目标时，你可以弃一张牌，并将此【杀】转移给你攻击范围内的另一名角色。（该角色不得是【杀】的使用者）",
                             @"大　乔",
                             @"无双——锁定技，你使用【杀】时，目标角色需连续使用两张【闪】才能抵消；与你进行【决斗】的角色每次需连续打出两张【杀】。\n★若对方只有一张【闪】或【杀】则即便使用（打出）了也无效。",
                             @"吕　布",
                             @"离间——出牌阶段，你可以弃一张牌并选择两名男性角色。若如此作，视为其中一名男性角色对另一名男性角色使用一张【决斗】。（此【决斗】不能被【无懈可击】响应）。每回合限用一次。\n闭月——回合结束阶段，可摸一张牌。\n★使用离间时，你决定是由哪个角色对另一个角色使用【决斗】。",
                             @"貂　蝉",
                             @"急救——你的回合外，你可以将你的任意红色牌当【桃】使用。\n青囊——出牌阶段，你可以主动弃掉一张手牌，令任一目标角色回复1点体力。每回合限用一次。",
                             @"华　佗",
                             @"据守——回合结束阶段，你可以摸三张牌。若如此做，将你的武将牌翻面。",
                             @"曹　仁",
                             @"雷击——每当你使用或打出一张【闪】时（在结算前），可令任意一名角色判定。若为黑桃花色，你对该角色造成2点雷电伤害。\n鬼道——在任意角色的判定牌生效前，你可用自己的一张黑桃或者草花牌替换之。\n黄天——主公技，群雄角色可在他们各自的出牌阶段给你一张【闪】或【闪电】。",
                             @"张　角",
                             @"蛊惑——当你需要使用或打出一张基本牌或非延时类锦囊牌时，你可以声明并将1张手牌扣于桌上。若无人质疑，则该牌按你所述之牌来用。若有人质疑则亮出验明：若为真，质疑者各失去1点体力；若为假，质疑者各摸1张牌。除非被质疑的牌为红桃花色且为真（仍然可用），否则无论真假，该牌都作废，弃置之。\n★失去体力没有伤害来源，并且不能触发任何与伤害有关的技能。\n★无人质疑时，将用于蛊惑的牌亮开，该牌的颜色即为于吉使用（或打出）这张牌的颜色。\n★没有体力的角色不能质疑。",
                             @"于　吉",
                             @"狂骨——锁定技，任何时候，每当你对与你距离为1以内的任意角色造成1点伤害，你回复1点体力值。",
                             @"魏　延",
                             @"烈弓——出牌阶段，以下两种情况，你可以令你使用的【杀】不可被闪避：\n1.目标角色的手牌数大于或等于你的体力值。\n2.目标角色的手牌数小于或等于你的攻击范围。",
                             @"黄　忠",
                             @"天香——每当你受到伤害时，你可以弃一张红桃手牌来转移此伤害给任意一名其他角色，然后该角色摸X张牌；X为该角色当前已损失的体力值。\n红颜——锁定技，你的黑桃牌均视为红桃牌。",
                             @"小　乔",
                             @"不屈——任何时候，当你的体力被扣减到0或更低时，每扣减1点体力：从牌堆亮出一张牌放在你的武将牌上，若该牌的点数与你武将牌上已有的任何一张牌都不同，你可以不死去。此牌亮出的时刻为你的濒死状态。",
                             @"周　泰",
                             @"神速——你可以选择以下一至两项：1.跳过你该回合的判定阶段和摸牌阶段2.跳过你该回合出牌阶段并弃一张装备牌你每做出上述之一选择，视为对任意一名其他角色使用了一张【杀】。",
                             @"夏侯渊",
                nil];
    AWBasicTVC* heroVC = [[AWBasicTVC alloc] initWithDic:heroDic ];
    heroVC.tabBarItem.image =  [UIImage imageNamed:@"Contact"];
    heroVC.tabBarItem.title =@"武将";

    
    NSDictionary* magicDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                             @"数量：3张\n花色：♣6 ♥6 ♠6\n出牌时机：出牌阶段。\n使用目标：除你以外，任意一名角色。\n作用效果：将【乐不思蜀】横置于目标角色判定区里，目标角色回合判定阶段，进行判定；若判定结果不为红桃，则跳过目标角色的出牌结算，将【乐不思蜀】弃置。\n★如判定结果为红桃，则没有事发生。\n★【乐不思蜀】在结算后都将被弃置。",
                             @"乐不思蜀",
                             @"数量：2张\n花色：♣Q、♣K\n出牌时机：出牌阶段。\n使用目标：除你以外，装备区里有武器牌的一名角色A。（你需要在此阶段选择另一个A使用【杀】能攻击到的角色B）。\n作用效果：A需对B使用一张【杀】，否则A必须将其装备的武器牌交给你。\n★A使用【杀】时，角色技能和武器技能可以照常发动。",
                             @"借刀杀人",
                             @"数量：4张\n花色：♦Q ♠J ♣Q、♣K\n出牌时机：目标锦囊对目标角色生效前。\n使用目标：目标锦囊。\n作用效果：抵消该锦囊对其指定的一名目标角色产生的效果。\n★【无懈可击】是1张可以在其他锦囊开始结算时使用的锦囊，它只能抵消目标锦囊对一名指定角色产生的效果。\n★【无懈可击】本身也是锦囊，所以也可以被抵消。\n★当【无懈可击】抵消【闪电】的效果后，【闪电】不会被弃置，而是继续传递给下家（见【闪电】段落）。",
                             @"无懈可击",
                              @"数量：1张\n花色：♥ A\n出牌时机：出牌阶段。\n使用目标：所有角色。\n作用效果：按行动顺序结算，目标角色回复1点体力。\n★这张牌会让包括你在内的角色各回复1点体力。\n",
                              @"桃园结义",
                              @"数量：1张\n花色：♥ A\n出牌时机：出牌阶段。\n使用目标：除你以外的所有角色。\n作用效果：按行动顺序结算，除非目标角色打出1张【闪】，否则该角色受到【万箭齐发】对其造成的1点伤害。\n★你必须指定除你以外的所有角色为目标，然后他们依次（从你的下家开始）选择是否打出【闪】。\n",
                              @"万箭齐发",
                              @"数量：3张\n花色：♦ A\n♠ A\n♣ A\n出牌时机：出牌阶段。\n使用目标：除你以外，任意一名角色。\n作用效果：由目标角色先开始，你和他（她）轮流打出一张【杀】，【决斗】对首先不出【杀】的一方造成1点伤害；另一方成为此伤害的来源。\n★使用【决斗】有可能让自己受伤。\n★受到因【决斗】导致的伤害时，来源为决斗的获胜方。\n",
                              @"决斗",
                              @"数量：3张\n花色：♠ 7、♠ K \n♣ 7\n出牌时机：出牌阶段。\n使用目标：除你以外的所有角色。\n作用效果：按行动顺序结算，除非目标角色打出1张【杀】，否则该角色受到【南蛮入侵】对其造成的1点伤害。\n★你必须指定除你以外的所有角色为目标，然后他们依次（从你的下家开始）选择是否打出【杀】。\n",
                              @"南蛮入侵",
                              @"数量：4张\n花色：♥ 7、♥ 8、♥ 9、♥ J\n出牌时机：出牌阶段。\n使用目标：自己。\n作用效果：摸两张牌。\n",
                              @"无中生有",
                              @"数量：2张\n花色：♥ 3、♥ 4\n出牌时机：出牌阶段。\n使用目标：所有角色。\n作用效果：按你从牌堆顶亮出等同于现存角色数量的牌，然后按行动顺序结算，目标角色选择并获得这些牌中的一张。\n★这张牌会让包括你在内的角色每人各从一定数量的牌里挑选一张加入手牌。\n",
                              @"五谷丰登",
                              @"数量：6张\n花色：♠ 3、♠ 4、♠ Q\n♥ Q\n♣ 3、♣ 4\n出牌时机：出牌阶段。\n使用目标：除你以外，任意一名角色。\n作用效果：你选择并弃掉目标角色手牌（随机选择）、装备区或判定区里的一张牌。\n★尽管目标角色判定区里的牌不属于他/她，你依然可以令他/她弃置那张牌。\n",
                              @"过河拆桥",
                              @"数量：5张\n花色：♦ 3、♦ 4 \n♠ 3、♠ 4、♠ J\n出牌时机：出牌阶段。\n使用目标：除你以外，与你距离1以内的一名角色。\n作用效果：你选择并获得目标角色手牌（随机选择）、装备区或判定区里的一张牌。\n★使用【顺手牵羊】时，注意你装备区里的【马】和目标角色装备区里的【马】。\n",
                              @"顺手牵羊",
                              @"数量：2张\n花色：♠ A\n♥ Q\n出牌时机：出牌阶段。\n使用目标：你。\n作用效果：将【闪电】横置于目标角色判定区里，目标角色回合判定阶段，进行判定；若判定结果为黑桃2-9之间（包括黑桃2和9），则【闪电】对目标角色造成3点伤害，将闪电弃置。若判定结果不为黑桃2-9之间（包括黑桃2和9），将【闪电】移动到当前目标角色下家（【闪电】的目标变为该角色）的判定区。\n★【闪电】的目标可能会不断地进行改变，直到它生效。若它被抵消，则将它直接移动到下家的判定区里（而不是判定后再移动）。\n★【闪电】造成的伤害没有来源。\n",
                              @"闪电",

                             nil];
    AWBasicTVC* magicVC = [[AWBasicTVC alloc] initWithDic:magicDic ];
    magicVC.tabBarItem.image = [UIImage imageNamed:@"Bookmark"];
    magicVC.tabBarItem.title =@"锦囊";
    
    NSDictionary* weaponDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"数量：1张\n花色：♠ 6\n装\n★对方的防具没有任何效果。",
                               @"青釭剑",
                               @"数量：2张\n花色：♦A ♣A\n装备类型：武器\n攻击范围：1\n武器特效：出牌阶段，你可以使用任意张【杀】。",
                               @"诸葛连弩",
                               @"数量：1张\n花色：♠ 2\n装备类型：武器\n攻击范围：2\n武器特效：当你使用【杀】造成伤害时，你可以防止此伤害，改为弃置该目标角色的两张牌（弃完第一张再弃第二张）。",
                              @"寒冰剑",
                               @"数量：1张\n花色：♦ 5\n装备类型：武器\n攻击范围：3\n武器特效：目标角色使用【闪】抵消你使用【杀】的效果时，你可以弃两张牌，则【杀】依然造成伤害。\n",
                               @"贯石斧",
                               @"数量：1张\n花色：♠ Q\n装备类型：武器\n攻击范围：3\n武器特效：当你需要使用（或打出）一张【杀】时，你可以将两张手牌当一张【杀】使用（或打出）。\n",
                               @"丈八蛇矛",
                               @"数量：1张\n花色：♠ 2\n装备类型：武器\n攻击范围：2\n武器特效：你使用【杀】时，指定了一名异性角色后，在【杀】结算前，你可以令对方选择一项：自己弃一张手牌或者让你从牌堆摸一张牌。\n",
                               @"雌雄双股剑",
                               @"数量：1张\n花色：♥ 5\n装备类型：武器\n攻击范围：5\n武器特效：你使用【杀】对目标角色造成伤害时，你可以将其装备区里的一匹马弃置。\n",
                               @"麒麟弓",
                               @"数量：1张\n花色：♦ Q\n装备类型：武器\n攻击范围：4\n武器特效：当你使用的【杀】是你的最后一张手牌时，你可以为这张【杀】指定至多三名目标角色，然后按行动顺序依次结算之。\n",
                               @"方天画戟",
                               @"数量：1张\n花色：♠ 5\n装备类型：武器\n攻击范围：3\n武器特效：当你使用的【杀】被【闪】抵消时，你可以立即对相同的目标再使用一张【杀】直到【杀】生效或你不愿意出了为止。\n",
                               @"青龙偃月刀",
                               @"数量：1张\n花色：♣ 2 \n装备类型：防具\n防具效果：锁定技，黑色的【杀】对你无效。",
                               @"仁王盾",
                               @"数量：2张\n花色：♣ 2 \n♠ 2\n装备类型：防具\n防具效果：每当你需要使用（或打出）一张【闪】时，你可以进行一次判定：若结果为红色，则视为你使用（或打出）了一张【闪】；若为黑色，则你仍可从手牌里使用（或打出）。\n★由八卦使用或打出的【闪】，并非从你的手牌中使用或打出。\n",
                               @"八卦阵",
                               @"【+1马】：其他角色计算与你的距离时，始终+1（你可以理解为一种防御上的优势），不同名称的+1马，其效果是相同的。 \n数量：3张\n花色：♥ K\n♣ 5\n♠ 5 \n【-1马】：你计算与其他角色的距离时，始终-1（你可以理解为一种进攻上的优势）,不同名称的-1马，其效果是相同的。\n数量：3张\n花色：♥ 5\n♦ K\n♠ K",
                               @"马",
                               @"v1.0 by iwanglian@gmail.com,内容取自http://www.sanguosha.com/ 标准版+风扩展包",
                               @"最终声明",

                              nil];
    AWBasicTVC* weaponVC = [[AWBasicTVC alloc] initWithDic:weaponDic ];
    weaponVC.tabBarItem.image =  [UIImage imageNamed:@"Download"];
    weaponVC.tabBarItem.title =@"武器";
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:heroVC,magicVC,weaponVC, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
