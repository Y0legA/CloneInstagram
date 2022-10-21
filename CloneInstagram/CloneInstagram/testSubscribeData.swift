//
//  testSubscribeData.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 20.10.22.
//

import Foundation

// тестовый массив постов раздела подписок
let onePost = Subscribe("doroty", "упомянул(-а) вас в комментарии: @momon спасибо", "heart", false, "post", "8ч", nil)
let twoPost = Subscribe("galina", "есть в инстаграмм, вы можете знать этого человека", "", true, "", "12ч", false)
let threePost = Subscribe("xranitel", "понравился ваш комментарий: 'Ходят тут всякие...'",
                          "heart", true, "invaders", "20ч", nil)
let fourPost = Subscribe("knight", "упомянул(-а) вас в комментарии: @momon а я его знаю)", "", false, "post", "1д", nil)
let fivePost = Subscribe("doroty", "подписалась на ваши обновления", "heart", false, "", "3д", true)
let sixPost = Subscribe("varior", "упомянул(-а) вас в комментарии: @momon спасибо", "party.popper.fill",
                        true, "end", "5д", nil)
let sevenPost = Subscribe("doroty", "понравился ваш комментарий: 'Навались'", "heart", true, "baze", "6д", nil)
let eightPost = Subscribe("doroty",
                          """
                          прокомментировал ваше видео: 'было это давно. Когда земля еще была молодой,
                        и первородные ящеры повсеместно и безусловно властвовали на бескрайних просторах,
                        прилетели вот эти черти'
                        """
                          , "heart", true, "alien", "1нед", nil)
let ninePost = Subscribe("doroty", "упомянул(-а) вас в комментарии: @momon спасибо", "heart", true, "post", "2нед", nil)
let tenPost = Subscribe("doroty", "есть в инстаграмм, вы можете знать этого человека", "", false, "", "3нед", false)
