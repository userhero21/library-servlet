package uz.jl.lessontwo.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum Language {
    UZ("Uzbek"),
    RU("Russian"),
    EN("English");
    private final String value;
}