package ptithcm.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.Book;

@Service
@Transactional
public class UploadService {
    @Autowired
    ServletContext context;

    public String saveFile(MultipartFile file) {
        String directory = System.getenv("APPDATA") + "\\PTITWEB\\imgs\\products\\"; // <-- Entry
        Path path = Paths.get(directory);

        try {
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }

            InputStream inputStream = file.getInputStream();
            Path filePath = path.resolve(file.getOriginalFilename());
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);

            return file.getOriginalFilename();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
            return null;
        }
    }

    public void getImage(Book book) {
        String directory = System.getenv("APPDATA") + "\\PTITWEB\\imgs\\products\\";
        String prijectDir = context.getRealPath("/") + "resources" + File.separator + "imgs" + File.separator
                + "products"
                + File.separator;
        String imgPath = book.getANH();

        if (imgPath == null) {
            System.out.println("No image found");
            return;
        }

        try {
            // move image from project directory to appdata directory
            Path source = Paths.get(directory + imgPath);
            Path dest = Paths.get(prijectDir + imgPath);
            Files.copy(source, dest, StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error getting image");
        }
    }

    public void getImage(List<Book> books) {
        for (Book book : books) {
            getImage(book);
        }
    }
}
