import CoreGraphics
import Foundation

// Window metadata can suggest an alert. Only the person at the Mac knows its meaning.
func isCandidate(_ window: [String: Any]) -> Bool {
    let owners = ["notificationcenter", "coreservicesuiagent", "securityagent"]
    guard let owner = window[kCGWindowOwnerName as String] as? String,
          let layer = window[kCGWindowLayer as String] as? Int,
          let bounds = window[kCGWindowBounds as String] as? [String: Any],
          let width = bounds["Width"] as? Double,
          let height = bounds["Height"] as? Double else { return false }
    return owners.contains(owner.lowercased()) && layer >= 5 && width > 80 && height > 60
}

#if SELF_CHECK
let fixture: [String: Any] = [
    kCGWindowOwnerName as String: "SecurityAgent",
    kCGWindowLayer as String: 10,
    kCGWindowBounds as String: ["Width": 300.0, "Height": 180.0],
]
precondition(isCandidate(fixture))
precondition(!isCandidate([:]))
precondition(!isCandidate(fixture.merging([kCGWindowOwnerName as String: "Finder"]) { _, new in new }))
#else
guard let windows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements],
                                               kCGNullWindowID) as? [[String: Any]],
      !windows.isEmpty else {
    FileHandle.standardError.write(Data("Window list unavailable in this session.\n".utf8))
    exit(1)
}
print(windows.filter(isCandidate).count)
#endif
