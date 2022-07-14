package uz.jl.lessontwo.domain;


import jakarta.persistence.*;
import lombok.*;
import uz.jl.lessontwo.enums.Language;

@Data
@Entity
@Table(name = "books")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String description;
    private String author;

    @Enumerated(EnumType.STRING)
    private Genre genre;

    @Enumerated(EnumType.STRING)
    private Language language;
    private int pageCount;
    private int downloadCount;

//    @OneToOne
////    @Column(name = "cover_id")
//    private Uploads cover;
//
//    @OneToOne
////    @Column(name = "file_id")
//    private Uploads file;

    @AllArgsConstructor
    @Getter
    public enum Genre {
        CRIME("Crime"),
        HORROR("Horror"),
        CI_FI("Ci-fi"),
        DRAMA("Drama"),
        ROMANCE("Romance"),
        ROMANCE_DRAMA("Romance Drama"),
        FANTASY("Fantasy");
        private final String key;

        public String getKey() {
            return key;
        }
    }



}
