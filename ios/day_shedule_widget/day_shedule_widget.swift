//
//  day_shedule_widget.swift
//  day_shedule_widget
//
//  Created by hostnes on 5.07.24.
//

import WidgetKit
import SwiftUI
import Intents

private let widgetGroupId = "group.flutter_day_widget_group"

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "Placeholder Title", description: "Placeholder Description")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let data = UserDefaults.init(suiteName: widgetGroupId)
        let entry = SimpleEntry(date: Date(),
                                title: data?.string(forKey: "title") ?? "No Title Yet",
                                description: data?.string(forKey: "description") ?? "No Description Yet")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
            var entries: [SimpleEntry] = []

            // Generate a timeline consisting of hourly updates
            let currentDate = Date()
            for hourOffset in 0 ..< 24 {
                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                let data = UserDefaults.init(suiteName: widgetGroupId)
                let entry = SimpleEntry(date: entryDate,
                                        title: data?.string(forKey: "title") ?? "No Title Yet",
                                        description: data?.string(forKey: "description") ?? "No Description Yet")
                entries.append(entry)
            }

            // Create a timeline with the hourly entries
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
    let description: String
}

struct day_shedule_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.title)
                .font(.headline)
            Text(entry.description)
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
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

