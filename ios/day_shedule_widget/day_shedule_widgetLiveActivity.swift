//
//  day_shedule_widgetLiveActivity.swift
//  day_shedule_widget
//
//  Created by hostnes on 30.08.24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct day_shedule_widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct day_shedule_widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: day_shedule_widgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension day_shedule_widgetAttributes {
    fileprivate static var preview: day_shedule_widgetAttributes {
        day_shedule_widgetAttributes(name: "World")
    }
}

extension day_shedule_widgetAttributes.ContentState {
    fileprivate static var smiley: day_shedule_widgetAttributes.ContentState {
        day_shedule_widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: day_shedule_widgetAttributes.ContentState {
         day_shedule_widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: day_shedule_widgetAttributes.preview) {
   day_shedule_widgetLiveActivity()
} contentStates: {
    day_shedule_widgetAttributes.ContentState.smiley
    day_shedule_widgetAttributes.ContentState.starEyes
}
