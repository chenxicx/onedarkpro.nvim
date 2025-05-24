; Additional C++ specific highlighting rules for OneDarkPro

; Ensure explicit and similar modifiers are highlighted as @keyword.modifier
[
  "explicit"
  "virtual"
  "override"
  "final"
  "inline"
  "constexpr"
  "consteval"
  "constinit"
  "noexcept"
] @keyword.modifier

; Ensure const and similar storage specifiers are highlighted as @keyword.storage  
[
  "const"
  "static" 
  "extern"
  "thread_local"
  "mutable"
  "volatile"
  "register"
] @keyword.storage

; Ensure these are highlighted as type qualifiers
[
  "const"
  "volatile"
  "restrict"
  "explicit"
] @type.qualifier
