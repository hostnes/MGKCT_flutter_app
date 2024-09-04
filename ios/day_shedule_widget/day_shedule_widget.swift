//
//  day_shedule_widget.swift
//  day_shedule_widget
//
//  Created by hostnes on 5.07.24.
//

import WidgetKit
import SwiftUI
import Intents

private let widgetGroupId = "group.day_shedule_widget"

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), data: "{}") // Пустой JSON для placeholder
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let data = UserDefaults(suiteName: widgetGroupId)
        let entry = SimpleEntry(
            date: Date(),
            data: data?.string(forKey: "data") ?? "{}"
        )
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let data = UserDefaults(suiteName: widgetGroupId)
            let entry = SimpleEntry(
                date: entryDate,
                data: data?.string(forKey: "data") ?? "{}"
            )
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let data: String
}

private func extractInfo(from jsonString: String) -> [[String: Any]] {
    var cleanData: [[String: Any]] = []
    let date = Date()
    let calendar = Calendar.current
    print(calendar.component(.weekday, from: date))
    var dayIndex = calendar.component(.weekday, from: date) - 2
    if calendar.component(.hour, from: date) >= 16 {
        dayIndex += 1
    }

    guard let data = jsonString.data(using: .utf8) else {
        print("Ошибка преобразования строки в данные")
        return cleanData
    }
    
    guard let jsonArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
        print("Ошибка преобразования данных в массив словарей")
        return cleanData
    }

    guard dayIndex >= 0 && dayIndex < jsonArray.count else {
        print("Индекс за пределами массива")
        return cleanData
    }

    let day = jsonArray[dayIndex]
    
    if let lessons = day["lessons"] as? [[String: Any]] {
        if lessons.count >= 3 {
            cleanData.append(lessons[0])
            cleanData.append(lessons[1])
            cleanData.append(lessons[2])
        }
    } else {
        print("Ошибка: 'lessons' не найдено или имеет неправильный формат")
    }
    
    return cleanData
}



struct day_shedule_widgetEntryView: View {
    var entry: SimpleEntry
    var cleanData: [[String: Any]] = []
    var date: Date
    var calendar: Calendar

    init(entry: SimpleEntry) {
        self.entry = entry
        self.cleanData = extractInfo(from: entry.data)
        self.date = Date()
        self.calendar = Calendar.current
    }
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 0) {
                ForEach(cleanData.indices, id: \.self) { index in
                    let lesson = cleanData[index]
                    if let title = lesson["title"] as? String,
                       let cabinet = lesson["cabinet"] as? String,
                       let numberLesson = lesson["number_lesson"] as? Int {

                        if index == 0 {
                            VStack {
                                Spacer()
                                HStack(alignment: .center, spacing: 10) {
                                    Text("\(numberLesson)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 20, alignment: .leading)
                                        .foregroundColor(.black)
                                    Text(title.replacingOccurrences(of: "#", with: "\n"))
                                        .font(.system(size: 10))
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil) // Поз
                                        .frame(width: 200, alignment: .leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)

                                    
                                    Text(cabinet)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 60, alignment: .leading)
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                            .frame(maxHeight: .infinity)
                        }
                        if index == 1 {
                            VStack {
                                Spacer()
                                HStack(alignment: .center, spacing: 10) {
                                    Text("\(numberLesson)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 20, alignment: .leading)
                                        .foregroundColor(.black)

                                    Text(title.replacingOccurrences(of: "#", with: "\n"))
                                        .font(.system(size: 10))
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil) // Поз
                                        .frame(width: 200, alignment: .leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)

                                    
                                    Text(cabinet)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 60, alignment: .leading)
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                            .frame(height: 70)
                        }
                        if index == 2 {
                            VStack {
                                Spacer()
                                HStack(alignment: .center, spacing: 10) {
                                    Text("\(numberLesson)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 20, alignment: .leading)
                                        .foregroundColor(.black)

                                    Text(title.replacingOccurrences(of: "#", with: "\n"))
                                        .font(.system(size: 10))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil) // Поз
                                        .frame(width: 200, alignment: .leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)

                                    
                                    Text(cabinet)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 60, alignment: .leading)
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                            .frame(maxHeight: .infinity)
                        }

                        if index < cleanData.count - 1 {
                            Divider()
                                .frame(height: 1)
                                .background(Color.black)
                        }
                    } else {
                        Spacer()
                        Text("Invalid Data")
                            .font(.caption)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
            .frame(maxHeight: .infinity)
            Spacer()
        }.containerBackground(for: .widget) {Color.white}
    }
}



struct day_shedule_widget: Widget {
    let kind: String = "day_shedule_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            day_shedule_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget")
        .supportedFamilies([.systemMedium])
    }
}

struct DaySheduleWidget_Previews: PreviewProvider {
    static var previews: some View {
        day_shedule_widgetEntryView(
            entry: SimpleEntry(
                date: Date(),
                data: """
                    [
                            {
                                "info": {
                                    "week_day": "Понедельник",
                                    "day": "02.09.2024"
                                },
                                "lessons": [
                                    {
                                        "number_lesson": 1,
                                        "title": "АвтУпрДеят (Лек) Дорц Н. А. ",
                                        "cabinet": "504 (к) "
                                    },
                                    {
                                        "number_lesson": 2,
                                        "title": "Визуал проект (Лек) Шавейко А. А. ",
                                        "cabinet": "3-202 (к) "
                                    },
                                    {
                                        "number_lesson": 3,
                                        "title": "Осн предпр дея (Лек) Федкевич Д. А. ",
                                        "cabinet": "401 (к) "
                                    },
                                    {
                                        "number_lesson": 4,
                                        "title": "1.Факульт ФКиЗ (ф-в) Анципов Е. Ю.  #2.Факульт ФКиЗ (ф-в) Усикова Л. Н. ",
                                        "cabinet": "- - "
                                    },
                                    {
                                        "number_lesson": 5,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 6,
                                        "title": "-",
                                        "cabinet": "-"
                                    }
                                ]
                            },
                            {
                                "info": {
                                    "week_day": "Вторник",
                                    "day": "03.09.2024"
                                },
                                "lessons": [
                                    {
                                        "number_lesson": 1,
                                        "title": "ООСиЭ (Лек) Поклад Т. И. ",
                                        "cabinet": "603 "
                                    },
                                    {
                                        "number_lesson": 2,
                                        "title": "Комп сети (Лек) Варицкая А. В. ",
                                        "cabinet": "2-206 (к) "
                                    },
                                    {
                                        "number_lesson": 3,
                                        "title": "Xamarin (Лек) Леус Ж. В. ",
                                        "cabinet": "3-212 (к) "
                                    },
                                    {
                                        "number_lesson": 4,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 5,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 6,
                                        "title": "-",
                                        "cabinet": "-"
                                    }
                                ]
                            },
                            {
                                "info": {
                                    "week_day": "Среда",
                                    "day": "04.09.2024"
                                },
                                "lessons": [
                                    {
                                        "number_lesson": 1,
                                        "title": "ПСС internet (Лек) Сушкевич Е. П. ",
                                        "cabinet": "2-206 (к) "
                                    },
                                    {
                                        "number_lesson": 2,
                                        "title": "Базы данных (Лек) Вайтович И. М. ",
                                        "cabinet": "3-205 (к) "
                                    },
                                                      {
                                                          "number_lesson": 4,
                                                          "title": "1.Факульт ФКиЗ (ф-в) Анципов Е. Ю.  #2.Факульт ФКиЗ (ф-в) Усикова Л. Н. #2.Факульт ФКиЗ (ф-в) Усикова Л. Н. ",
                                                          "cabinet": "- - "
                                                         
                                                      },
                                    {
                                        "number_lesson": 3,
                                        "title": "Комп сети (Лек) Варицкая А. В. ",
                                        "cabinet": "2-316 "
                                    },
                                    {
                                        "number_lesson": 4,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 5,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 6,
                                        "title": "-",
                                        "cabinet": "-"
                                    }
                                ]
                            },
                            {
                                "info": {
                                    "week_day": "Четверг",
                                    "day": "05.09.2024"
                                },
                                "lessons": [
                                    {
                                        "number_lesson": 1,
                                        "title": "Осн предпр дея (Лек) Федкевич Д. А. ",
                                        "cabinet": "401 (к) "
                                    },
                                    {
                                        "number_lesson": 2,
                                        "title": "АвтУпрДеят (Лек) Дорц Н. А. ",
                                        "cabinet": "504 (к) "
                                    },
                                    {
                                        "number_lesson": 3,
                                        "title": "Бух учет (Лек) Русинская С. А. ",
                                        "cabinet": "- "
                                    },
                                    {
                                        "number_lesson": 4,
                                        "title": "Xamarin (Лек) Леус Ж. В. ",
                                        "cabinet": "3-212 (к) "
                                    },
                                    {
                                        "number_lesson": 5,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 6,
                                        "title": "-",
                                        "cabinet": "-"
                                    }
                                ]
                            },
                            {
                                "info": {
                                    "week_day": "Пятница",
                                    "day": "06.09.2024"
                                },
                                "lessons": [
                                    {
                                        "number_lesson": 1,
                                        "title": "ПСС internet (Лек) Сушкевич Е. П. ",
                                        "cabinet": "2-206 (к) "
                                    },
                                    {
                                        "number_lesson": 2,
                                        "title": "Базы данных (Лек) Вайтович И. М. ",
                                        "cabinet": "3-205 (к) "
                                    },
                                    {
                                        "number_lesson": 3,
                                        "title": "Визуал проект (Лек) Шавейко А. А. ",
                                        "cabinet": "3-202 (к) "
                                    },
                                    {
                                        "number_lesson": 4,
                                        "title": "1.ФЗКиЗ (Лек) Анципов Е. Ю. 2.ФЗКиЗ (Лек) Усикова Л. Н. ",
                                        "cabinet": "- - "
                                    },
                                    {
                                        "number_lesson": 5,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 6,
                                        "title": "-",
                                        "cabinet": "-"
                                    }
                                ]
                            },
                            {
                                "info": {
                                    "week_day": "Суббота",
                                    "day": "07.09.2024"
                                },
                                "lessons": [
                                    {
                                        "number_lesson": 1,
                                        "title": "Базы данных (Лек) Вайтович И. М. ",
                                        "cabinet": "3-205 (к) "
                                    },
                                    {
                                        "number_lesson": 2,
                                        "title": "Бух учет (Лек) Русинская С. А. ",
                                        "cabinet": "- "
                                    },
                                    {
                                        "number_lesson": 3,
                                        "title": "Комп сети (Лек) Варицкая А. В. ",
                                        "cabinet": "- "
                                    },
                                    {
                                        "number_lesson": 4,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 5,
                                        "title": "-",
                                        "cabinet": "-"
                                    },
                                    {
                                        "number_lesson": 6,
                                        "title": "-",
                                        "cabinet": "-"
                                    }
                                ]
                            }
                        ]
                  """
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
