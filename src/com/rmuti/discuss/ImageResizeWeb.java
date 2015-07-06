package com.rmuti.discuss;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.rmuti.Config;

public class ImageResizeWeb {
	private static final int IMG_WIDTH = 100;
	private static final int IMG_HEIGHT = 100;

	public void getImageResize(String nameImage) {

		try {

			BufferedImage originalImage = ImageIO.read(new File(
					Config.path_file + "/" + nameImage));
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
					: originalImage.getType();
			BufferedImage resizeImagePng = resizeImage(originalImage, type);
			ImageIO.write(resizeImagePng, "png", new File(
					Config.path_file_resize + "/" + nameImage));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static BufferedImage resizeImage(BufferedImage originalImage,
			int type) {
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT,
				type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();

		return resizedImage;
	}

	private static BufferedImage resizeImageWithHint(
			BufferedImage originalImage, int type) {

		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT,
				type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		g.setComposite(AlphaComposite.Src);

		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
				RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g.setRenderingHint(RenderingHints.KEY_RENDERING,
				RenderingHints.VALUE_RENDER_QUALITY);
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
				RenderingHints.VALUE_ANTIALIAS_ON);

		return resizedImage;
	}

	public static void main(String[] args) {

		try {

			BufferedImage originalImage = ImageIO
					.read(new File(
							"D:\\Jobs\\Eclipsespace\\DiscussAppWeb\\WebContent\\images\\1436086303542.png"));
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB
					: originalImage.getType();

			BufferedImage resizeImagePng = resizeImage(originalImage, type);
			ImageIO.write(
					resizeImagePng,
					"png",
					new File(
							"D:\\Jobs\\Eclipsespace\\DiscussAppWeb\\WebContent\\images\\re_1436086303542.png"));

		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}
